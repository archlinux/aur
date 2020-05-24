# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=mlrpt-git
pkgver=r2.3086594
pkgrel=1
pkgdesc="Application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=(i686 x86_64)
license=('GPL3')
url="https://github.com/dvdesolve/mlrpt"
depends=(rtl-sdr airspy)
makedepends=(git cmake make gcc)
provides=(mlrpt)
conflicts=(mlrpt)
source=("$pkgname::git+https://github.com/dvdesolve/mlrpt.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}"

  cd build
  make DESTDIR="${pkgdir}" install
}
