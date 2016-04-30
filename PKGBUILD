# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: OmeGa <omega@mailoo.org>

_pkgname=music-file-organizer
pkgname=music-file-organizer-git
pkgver=1.0.r5.gb5e828d
pkgrel=1
pkgdesc='Audio file organizer that reads tags and renames files (development version)'
url='http://git.zx2c4.com/music-file-organizer'
license=('GPL')
source=('git+http://git.zx2c4.com/music-file-organizer')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('icu' 'taglib')
makedepends=('git')
conflicts=('music-file-organizer')
provides=('music-file-organizer')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it!
  # Currently broken with clang, force GCC.
  make CC=gcc CXX=g++
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh ts=2 sw=2 et
