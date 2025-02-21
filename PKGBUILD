# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawproject-cn
_pkgname=EdrawProj-3
pkgver=3.7.4
pkgrel=1
arch=('x86_64')
depends=(
    curl
    dbus
    e2fsprogs
    expat
    gcc-libs
    glib2
    glibc
    hicolor-icon-theme
    libssh2
    krb5
    zlib)
options=(!strip)
conflicts=("edrawproject")
pkgdesc="可用于甘特图绘制、项目计划、资源分配和预算管理。软件轻巧，功能强大！"
license=('LicenseRef-Commercial')
url="https://www.edrawsoft.cn/edrawproject/"
source_x86_64=("${pkgname}_${pkgver}.deb::https://cc-download.wondershare.cc/prd/edrawproj_full5376.deb")
sha256sums_x86_64=('35e4c7b92eb863d22f9c29098286d43bc394b17b037819706108779550b26d66')

prepare() {
    #     ar -x *.deb
    mkdir -pv "$srcdir/$pkgname"
    tar -xf "$srcdir/data.tar.xz" --xattrs-include='*' --numeric-owner -C "$pkgname"
}
package() {
    #    export LC_CTYPE="zh_CN.UTF-8"
    cp -r ${srcdir}/${pkgname}/* ${pkgdir}

    install -dm755 "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/icons/"

    ln -sf "/opt/${_pkgname}/edrawproj.sh" "${pkgdir}/usr/bin/edrawproject"
    ln -sf "/opt/${_pkgname}/edrawproject.png" "${pkgdir}/usr/share/icons/edrawproject.png"
    rm -rf ${pkgdir}/usr/share/applications/.*

}
