# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Barfin
# Contributor: Kostis Karantias <kkarantias [at] gmail [dot] com>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Ricardo Funke <ricardo [at] gmail [dot] com>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Iwan Timmer <irtimmer [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Ricardo Band <me [at] xengi [dot] de>
# Contributor: Axilleas Pipinellis (aka axil42) <axilleas [at] archlinux [dot] info>
# Contributor: UshakovVasilii <UshakovVasilii [at] yahoo [dot] com>
# Contributor: Giulio Fidente <gfidente [at] gmail [dot] com>
# Contributor: xantares <xantares09 [at] hotmail [dot] com>
# Contributor: petterk <stifler3k [at] hotmail [dot] com>
# Contributor: Stephan Springer <buzo+arch (at) Lini (dot) de>

pkgname=popcorntime-bin
_pkgname=popcorntime
pkgver=0.5.0
pkgrel=1
pkgdesc="Stream free movies and TV shows from torrents"
arch=('x86_64')
url="https://github.com/popcorn-official/popcorn-desktop"
license=('GPL3')
depends=('nss' 'ttf-font' 'libxss' 'gtk3')
makedepends=('unzip')
provides=('popcorntime' 'popcorntime-ce')
conflicts=('popcorntime' 'popcorntime-ce')
options=('!strip')
_zipfile="Popcorn-Time-${pkgver}-linux64.zip"
source=("https://github.com/popcorn-official/popcorn-desktop/releases/download/v${pkgver}/$_zipfile"
        "${_pkgname}.desktop" )
sha256sums=('0391bae8a90243502238e3b4d9d645015cfa76abc2a26adde655d0e167354b4b'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334')

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Link to program
  ln -s "../share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

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
