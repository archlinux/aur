# Port pkgbuild for aur4
# Original pkgbuild is here: https://github.com/aur-archive/flaxpdf-git
# manteiner: pekman
# initial submission: 26/september/2015

pkgname=flaxpdf-git
pkgver=20152609
pkgrel=1
pkgdesc="A simple FLTK PDF viewer"
arch=('i686' 'x86_64')
url="https://github.com/clbr/flaxpdf"
license=('GPL3')
depends=('fltk' 'poppler' 'lzo')
makedepends=('automake' 'autoconf' 'git')

source=(git://github.com/clbr/flaxpdf.git)
sha256sums=('SKIP')

build() {
  cd flaxpdf

  mkdir -p config
  touch config/config.rpath
  ./autogen.sh

  # ensure gcc because clang doesn't support OpenMP yet
  CC=gcc CXX=g++ ./configure --prefix=/usr 

  make
}

package() {
  cd flaxpdf
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
