# Maintainer: ZorinArch < zorinarch at proton dot me >
# Contributor: HEx_404 < HEx_404x at proton dot me >

pkgname=ab-download-manager-bin
_pkgname=ABDownloadManager
pkgver=1.11.1
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
sha256sums_x86_64=("c95dc4c05af00934ba3a87e82ccddb6ec95b7bbad049d210da6509f3ada65f49")
sha256sums_aarch64=("f23596ff1743a31fc70e0a203e98cfe9a36f35e962886612a9ad6a380fc73e89")

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
