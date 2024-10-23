# Maintainer: shilka <shilkazx at gmail dot com>

pkgname=tdx-bin
pkgver=7.64
pkgrel=1
pkgdesc="通达信信创桌面版，通达信金融终端"
arch=("x86_64")
url="https://www.tdx.com.cn/soft.html"

source=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://data.tdx.com.cn/kylin/com.tdx.tdxcfv_${pkgver}_amd64.deb")
depends=(
    libx11
    freetype2
    libxext
    alsa-lib
    fontconfig
    libxss
    libxcb
    nspr
    gtk2
    at-spi2-core
    libxtst
    libnss_nis
    zenity
)

#source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://data.tdx.com.cn/kylin/com.tdx.tdxcfv_${pkgver}_amd64.deb")
# source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.deb::https://data.tdx.com.cn/kylin/com.tdx.tdxcfv_${pkgver}_arm64.deb")

sha256sums=('22aff03c4b26fb67c2c049056f785d6fb56cd855fc3171dbb65a99ab9cfd4454')
#sha256sums_aarch64=('7ab7a0fc74aca6b750acb1439478b3477a7121eadd6a66a001cd4b81d2144793')

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${srcdir}"

}
package() {
    cd $srcdir
    mkdir -p $pkgdir/opt
    cp -rf usr $pkgdir/
    cp -rf opt/apps/com.tdx.tdxcfv/files ${pkgdir}/opt/tdx-bin
    cp -rf opt/apps/com.tdx.tdxcfv/entries/applications/* ${pkgdir}/usr/share/applications
    cp -rf opt/apps/com.tdx.tdxcfv/entries/icons/* ${pkgdir}/usr/share/icons

    sed -i "s|^Exec=/opt/apps/.*|Exec=/opt/tdx-bin/bin/tdxw.sh|g" \
        $pkgdir/usr/share/applications/com.tdx.tdxcfv.desktop

}
