# Maintainer: Voylin <voylinslife@gmail.com>

pkgname=gozen-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimalistic video editor (binary AppImage release)"
arch=('x86_64')
url="https://github.com/VoylinsGamedevJourney/GoZen"
license=('GPL3')
provides=('gozen')
conflicts=('gozen' 'gozen-git')

# Adjust this to match the current release file
_appimage="gozen-v${pkgver}-alpha-x86_64.AppImage"

source=(
  "${_appimage}::https://github.com/VoylinsGamedevJourney/GoZen/releases/download/v${pkgver}-alpha/${_appimage}"
)
sha256sums=('SKIP') # You should update with real checksum per release

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/gozen.AppImage"

  # Symlink into PATH
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/gozen.AppImage" "${pkgdir}/usr/bin/gozen"

  # Desktop integration (optional, if your repo includes .desktop and icons)
  install -Dm644 "${srcdir}/gozen.desktop" "${pkgdir}/usr/share/applications/gozen.desktop"
  install -Dm644 "${srcdir}/gozen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gozen.png"
  install -Dm644 "${srcdir}/gozen.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gozen.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

