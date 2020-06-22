# Maintainer: motte <ettom22 at hotmail dot com>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

_pkgname=ddcutil
pkgname=ddcutil-git
pkgver=v0.9.9.r0.gdf01384d
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB (development version).'
url='http://ddcutil.com/'
license=('GPL2')
source=('git+https://github.com/rockowitz/ddcutil.git#branch=0.9.9-dev')
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

# vim: ft=sh ts=2 sw=2 et
