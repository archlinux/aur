# Maintainer: ZorinArch < zorinarch at proton dot me >
# Contributor: HEx_404 < HEx_404x at proton dot me >

pkgname=ab-download-manager-bin
_pkgname=ABDownloadManager
pkgver=1.9.2
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=(x86_64 aarch64)
url="https://abdownloadmanager.com/"
license=("Apache-2.0")
depends=("glibc" "java-runtime" "zlib" "alsa-lib" "libglvnd" "libxi" "freetype2" "libxtst" "libxrender" "fontconfig" "libx11" "libxext" "libappindicator-gtk3")
provides=("abdownloadmanager" "ab-download-manager")
conflicts=("abdownloadmanager" "ab-download-manager")
options=(!debug)
source_x86_64=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz")
source_aarch64=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=("f80bbb0db2e34649bbccb20fd1f9767c395de8eca70cb11f30f168350577e888")
sha256sums_aarch64=("b7afcfe0298cdc2e3c398cc9e7661d1338c24692d03882516d0be25f6e9d4e00")

package() {
    install -d "${pkgdir}/usr/share/"{applications,pixmaps}


    mv "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    mv "${srcdir}/${_pkgname}/"{bin,lib} "${pkgdir}/usr"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/com.abdownloadmanager.desktop" <<EOF
[Desktop Entry]
Name=AB Download Manager
Comment=Manage and organize your download files better than before
GenericName=Download Manager
Exec=env SKIKO_RENDER_API=SOFTWARE ${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Network;Utility;
StartupWMClass=com-abdownloadmanager-desktop-AppKt
EOF
}
