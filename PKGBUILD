# Maintainer: ZorinArch < zorinarch at proton dot me >
# Contributor: HEx_404 < HEx_404x at proton dot me >

pkgname=ab-download-manager-bin
_pkgname=ABDownloadManager
pkgver=1.11.0
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
sha256sums_x86_64=("69ac50caf049a51d5a2f983003bed4d88c91e2adf7bd9427e4c8f567e3f07fa0")
sha256sums_aarch64=("407845e9e21c6a7242f49f0308e34c6c70ae37b0fad2ea8b2d07592afac76f90")

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
