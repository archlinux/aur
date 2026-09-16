# Maintainer: Ostoja <ostoja@sredojevic.net>
pkgname=chromatix-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Chromatix is a desktop music player for Plex and Jellyfin that transforms your listening experience and makes interacting with your music libraries a joy."
arch=('x86_64' 'aarch64')
url="https://github.com/chromatix-app/chromatix-release"
depends=('fuse2')
provides=('chromatix')
conflicts=('chromatix')
options=('!debug' '!strip')
_icon='usr/share/icons/hicolor/512x512/apps/chromatix.png'
source=("chromatix.desktop")
source_x86_64=("chromatix-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/Chromatix-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("chromatix-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/Chromatix-${pkgver}-linux-arm64.AppImage")
sha256sums=('6b2f0c8bb87b1ccfdd6b31cea8931197c08ea02efa91b3d480f5031248576317')
sha256sums_x86_64=('06d58036fa7f002d1cae1d217562452362540a11e451331eae8efd72fce72542')
sha256sums_aarch64=('0a88db6e3eb57f44f22aa6fb8817b2f149fa6e0ec0a78d860804a21e414b46c3')

prepare() {
    chmod +x "chromatix-${pkgver}-${CARCH}.AppImage"
    "./chromatix-${pkgver}-${CARCH}.AppImage" --appimage-extract "${_icon}" >/dev/null
}

package() {
    install -Dm755 "${srcdir}/chromatix-${pkgver}-${CARCH}.AppImage" "${pkgdir}/opt/chromatix/chromatix.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/chromatix/chromatix.AppImage "${pkgdir}/usr/bin/chromatix"
    install -Dm644 "${srcdir}/chromatix.desktop" "${pkgdir}/usr/share/applications/chromatix.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_icon}" "${pkgdir}/${_icon}"
}
