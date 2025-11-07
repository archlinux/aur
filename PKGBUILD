# Maintainer: Filth <filth [at] wagn [dot] me>

_pkgname=mari0
pkgname="$_pkgname-git"
pkgver=1.6.2.r27.g57829fd
pkgrel=2
pkgdesc="Recreation of Super Mario Bros, with portals"
arch=('any')
options=("!strip" "!debug")
url="https://stabyourself.net/mari0/"
license=('MIT')
depends=('love' 'sh')
makedepends=('git' 'zip')
conflicts=('mari0')
source=("$_pkgname.desktop"
        "$_pkgname.sh"
        "git+https://github.com/Stabyourself/mari0.git")
b2sums=('fd257edab80a4008b3a4b1b3d831bbd20fa4c641c97a2ba09d36139fb772cb6d72f3595aef5766c937e63a1421e67b3b1c965baf7f11fa1a99718d411ddf918c'
        '8d4b49481ebb2ca00aa30da8623bb301566bbd5d030ec29421d2d38ed1ad441a44c7ae7fb143ade0c9dcf80d4800ea07c89944560addb0cf2fbf8ab2e6fd1ed0'
        'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Make love package
  cd "${srcdir}"/${_pkgname}
  zip -r9 "${srcdir}"/${_pkgname}.love *

  # Install Data
  install -Dm755 "${srcdir}/${_pkgname}.love" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.love"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "$pkgdir/usr/share/${_pkgname}/README.md"

  # Install Launcher
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Install Desktop
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/_DO_NOT_INCLUDE/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # Cleanup unnecessary files
  rm -rf "$pkgdir/usr/share/games/$_pkgname/_DO_NOT_INCLUDE"
}
