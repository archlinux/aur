# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=xunlei-bin
pkgver=1.0.0.5
pkgrel=1
pkgdesc="Xunlei download, 迅雷"
arch=("x86_64" "aarch64")
url="https://www.xunlei.com/"
license=("custom")
depends=('dbus-glib' 'libxtst' 'gtk2' 'alsa-lib' 'nss' 'libxss')
provides=('xunlei')
source=("license.html"
    "xunlei"
)
source_x86_64=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xunlei.download/com.xunlei.download_${pkgver}_amd64.deb")
source_aarch64=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xunlei.download/com.xunlei.download_${pkgver}_arm64.deb")

sha512sums=('3b0056713d046b01b01de9679a605bbf810c1f6f8c022b2200e14ef864db0583c46b3b9ccc9a0246bb3d70d3fad3415c33804cac5486d1cffb2d3081566d17bd'
            'c8c737c7fb30b7428005aa6bfb51fbc9ed3b2867286e1f461be900001d36f1961147912efa828c106ba846672a7571537fb42f5860bc687de30f5613e458881c')
sha512sums_x86_64=('3e6ffe2b3060927f4854cd16db2cbdb77c8fa2bcfd8939a4fc852873e0c55bf21f9a2d225cb504c1864def6a33ef67ebf3d2cf5289800404981c65f10769abbc')
sha512sums_aarch64=('f155c252cb148ab75672868c5a125c35c6f11287df0f1a4d811e581051b66bb545be5507c0540e134db9268c5cf6522ec8b3e4633a0d59025f05c0bf3a67724f')

prepare() {
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"

}

package() {
    cd ${srcdir}
    mkdir -p ${pkgdir}/opt/xunlei
    mv opt/apps/com.xunlei.download/files/* ${pkgdir}/opt/xunlei

    install -D opt/apps/com.xunlei.download/entries/applications/com.xunlei.download.desktop \
        ${pkgdir}/usr/share/applications/com.xunlei.download.desktop

    mkdir -p ${pkgdir}/usr/share/
    mv opt/apps/com.xunlei.download/entries/icons ${pkgdir}/usr/share/icons
    mv ${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.thunder.download.svg \
        ${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.xunlei.download.svg

    install -Dm644 license.html ${pkgdir}/usr/share/licenses/xunlei/license.html

    sed -i 's|^Exec.*|Exec=xunlei %U|;s|^Icon.*|Icon=com.xunlei.download|;s|^Categories.*|Categories=Network|' \
    ${pkgdir}/usr/share/applications/com.xunlei.download.desktop

    install -Dm755 xunlei ${pkgdir}/opt/xunlei/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/xunlei/start.sh ${pkgdir}/usr/bin/xunlei

}
