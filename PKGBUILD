# Maintainer: Kostis Karantias <kkarantias [at] gmail [dot] com>
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

pkgname=popcorntime-ci-bin
_pkgname=popcorntime
pkgver=0.3.10
pkgrel=362
pkgdesc="Stream movies and TV shows from torrents (continuous integration builds)"
arch=('i686' 'x86_64')
url="https://popcorntime.sh"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libxtst' 'libnotify' 'desktop-file-utils')
provides=('popcorntime' 'popcorn-time-ce' 'popcorntime-bin')
conflicts=('popcorntime')
options=('!strip')
source=("${_pkgname}.desktop")
source_i686=("https://ci.popcorntime.sh/job/Popcorn-Time-Desktop/${pkgrel}/artifact/build/Popcorn-Time-${pkgver}_linux32.tar.xz")
source_x86_64=("https://ci.popcorntime.sh/job/Popcorn-Time-Desktop/${pkgrel}/artifact/build/Popcorn-Time-${pkgver}_linux64.tar.xz")
sha512sums=('7e6538a7b39465439a62cb089510b6d85a65ad4bfa74d21b692363d1176ee94165ab7b5fef5f3470bf821cfc9f3b3a23763b8e3d8530420d7fa97c66083c3adb')
sha512sums_i686=('5b6b9ba1232e6bdd3d7b8a949115d0020cf0fed9e2ed3d9d657c9c1a4230ec43ab25a7030d3dbc25b069ab6758bcc73bc659b8a232ad17a70cba7cb801bb374e')
sha512sums_x86_64=('4995da3263738fd9c99ad9158d13d768627a132253afe9f42d59c6ff6fc90d4ab1569b95b7c9f342b2a09145908af7baac0755d71542b1a5a98c0bbd80ff916a')

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Link to program
  ln -s "/usr/share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Remove makepkg-created symlinks before copying content
  rm *.tar.xz *.desktop

  # Copy complete content of source archive to /usr/share/${_pkgname}/
  cp -a "${srcdir}"/* "${pkgdir}/usr/share/${_pkgname}/"

  # Fix permissions
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 600 -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 700 -exec chmod 755 '{}' \;
}
