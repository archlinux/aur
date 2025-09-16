# Maintainer: ZorinArch < zorinarch at proton dot me >
# Contributor: HEx_404 < HEx_404x at proton dot me >

pkgname=ab-download-manager-bin
_pkgname=ABDownloadManager
pkgver=1.6.13
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads"
arch=("x86_64")
url="https://abdownloadmanager.com/"
license=("Apache-2.0")
depends=("glibc" "java-runtime" "zlib" "alsa-lib" "libglvnd" "libxi" "freetype2" "libxtst" "libxrender" "fontconfig" "libx11" "libxext" "libappindicator-gtk3")
provides=("abdownloadmanager" "ab-download-manager")
conflicts=("abdownloadmanager" "ab-download-manager")
options=(!debug)
source=("https://github.com/amir1376/${pkgname%-bin}/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz")
sha256sums=("6ea29c3a94cb8a2a650496af8d7f0920bf765c09710d23d7b7d86f41b3c3200b")

package() {
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/share/"{applications,pixmaps}

    mv "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    mv "${srcdir}/${_pkgname}" "${pkgdir}/opt"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/com.abdownloadmanager.desktop" <<EOF
[Desktop Entry]
Name=AB Download Manager
Comment=Manage and organize your download files better than before
GenericName=Download Manager
Exec=/opt/${_pkgname}/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Network;Utility;
StartupWMClass=com-abdownloadmanager-desktop-AppKt
EOF
}
