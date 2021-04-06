# Maintainer: Gladyshev Ilya <fixfromdarkness@cock.li>

pkgname=popcorntime-ru-bin
_pkgname=popcorntime-ru
pkgver=0.4.5
_pkgver=0.4.4
pkgrel=2
pkgdesc="Stream free movies and TV shows from torrents with Russian translation"
arch=('x86_64')
url="https://popcorn-ru.tk"
license=('GPL3')
depends=('nss' 'ttf-font' 'libxss' 'gtk2' 'gtk3')
makedepends=('unzip')
provides=('popcorntime' 'popcorntime-ce')
conflicts=('popcorntime' 'popcorntime-ce')
options=('!strip')
_zipfile="Popcorn-Time-Ru-${_pkgver}-linux64.zip"
source=("https://github.com/popcorn-time-ru/popcorn-desktop/releases/download/v${_pkgver}/${_zipfile}"
        "${_pkgname}.desktop" )
sha256sums=('41f80e2a53988fdd5ea9e3bec73b2eb532ebaa8cbfef0e336c8f6e3fd9fb7d7b'
            '144dc8864d74abed5022b354ecd34b9a7bc6a0f0fdd442e0bac438c2ce6c4c5b')

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Link to program
  ln -s "../share/${_pkgname}/Popcorn-Time-Ru" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Remove makepkg-created symlinks before copying content
  rm "$_zipfile" "${_pkgname}.desktop"

  # Copy complete content of source archive to /usr/share/${_pkgname}
  cp -a "${srcdir}"/* "${pkgdir}/usr/share/${_pkgname}"

  # Fix permissions
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 600 -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 700 -exec chmod 755 '{}' \;
}
