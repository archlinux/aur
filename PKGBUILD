# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=mlrpt-git
pkgver=r13.62aacaa
pkgrel=1
pkgdesc="Application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=(i686 x86_64)
license=(GPL3)
url="https://github.com/dvdesolve/mlrpt"
depends=('soapysdr>=0.8.0' libconfig libjpeg-turbo)
makedepends=(git cmake make)
optdepends=('soapyrtlsdr: RTL-SDR support'
            'soapyairspy: Airspy support')
provides=(mlrpt)
conflicts=(mlrpt)
source=("${pkgname}::git+https://github.com/dvdesolve/mlrpt.git")
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
