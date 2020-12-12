# Maintainer: Neitsab Esrevart <firstname at lastname dot net>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Kostis Karantias <kkarantias [at] gmail [dot] com>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
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

pkgname=popcorntime-bin-ci
_pkgname=popcorntime
pkgver=0.4.4
pkgrel=1
pkgdesc="A multi-platform, free software BitTorrent client that includes an integrated media player - latest dev build from CI artefact"
arch=('x86_64')
url="https://popcorntime.app/"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss' 'ttf-font')
makedepends=('unzip')
provides=('popcorntime' 'popcorntime-ce')
conflicts=('popcorntime' 'popcorntime-ce' 'popcorntime-bin')
options=('!strip')
source=("https://ci.popcorntime.app/job/Popcorn-Time-Desktop/lastSuccessfulBuild/artifact/build/Popcorn-Time-${pkgver}_linux64.zip"
        "${_pkgname}.desktop" )
sha256sums=('SKIP'
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
  rm "Popcorn-Time-${pkgver}_linux64.zip" "${_pkgname}.desktop"

  # Copy complete content of source archive to /usr/share/${_pkgname}
  cp -a "${srcdir}"/* "${pkgdir}/usr/share/${_pkgname}"

  # Fix permissions
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 600 -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 700 -exec chmod 755 '{}' \;
}
