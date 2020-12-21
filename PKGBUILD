# Maintainer: Pagnite <tymoteuszdolega at gmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

_pkgname=ddcutil
pkgname=ddcutil-git
pkgver=v1.0.0.r0.c2c9d0a
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB (development version).'
url='http://ddcutil.com/'
license=('GPL2')
source=('git+https://github.com/rockowitz/ddcutil.git#branch=1.0.0-dev')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
provides=('ddcutil')

depends=(
  'libdrm'
  'libusb'
  'glib2'
  'libdrm'
  'libgudev'
  'libxrandr')

makedepends=(
  'git'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
