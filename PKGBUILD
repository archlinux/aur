# Contributor: Hinrich Harms <arch@hinrich.de>
# Contributor: sylvain alborini <sylvain.alborini@gmail.com>
# Maintainer: John Wallaby <drunken.wallaby@gmail.com>
# Co-Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=dfandrich
_pkgname=gpscorrelate
_branch=master
pkgname=${_pkgname}-git
pkgver=r157.963103d
pkgrel=1
pkgdesc='GPS Photo Correlation; Writes location data to EXIF tags using GPX files (command line and GTK interface).'
arch=('x86_64')
url='https://github.com/freefoote/gpscorrelate'
license=('GPL2')
depends=('libxml2' 'gtk3' 'exiv2')
makedepends=('git' 'libxslt')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-${_branch}

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}-${_branch}
  make prefix=/usr CFLAGS=-DENABLE_NLS GTK=3
}

check() {
  cd ${_pkgname}-${_branch}
  make check
}

package() {
  cd ${_pkgname}-${_branch}
  make prefix=/usr DESTDIR=$pkgdir install install-po install-desktop-file
}

# vim: ft=sh ts=2 sw=2 et
