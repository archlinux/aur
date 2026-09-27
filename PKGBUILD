# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=libcupsfilters
pkgname="${_pkgname}"-git
pkgver=2.2.1.r23.gdee3b387
pkgrel=1
pkgdesc="Code of the filters of the former cups-filters package as library functions"
arch=('x86_64' 'aarch64')
url="https://github.com/OpenPrinting/${_pkgname}"
license=('Apache-2.0')
depends=('libcups-git' 'lcms2' 'libjpeg-turbo' 'libpng' 'libtiff' 'libexif' 'fontconfig' 'libjxl')
makedepends=('git' 'ghostscript' 'mupdf-tools' 'poppler' 'ttf-dejavu')
#checkdepends=('ttf-dejavu')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always --tags | sed 's|-|.r|;s|-|.|'
}

prepare() {
  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd ${_pkgname}
  make
}

#check() {
#  cd ${_pkgname}
#  make check
#}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}/" install
}
