# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=glrpt-git
pkgver=r51.d29f449
pkgrel=1
pkgdesc="Interactive GUI application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=(i686 x86_64)
license=(GPL3)
url="https://github.com/dvdesolve/glrpt"
depends=('gtk3>=3.22.0' glibc glib2 'soapysdr>=0.8.0' libconfig libjpeg-turbo)
makedepends=(git cmake make)
optdepends=('soapyrtlsdr: RTL-SDR support'
            'soapyairspy: Airspy support')
provides=(glrpt)
conflicts=(glrpt)
source=("${pkgname}::git+https://github.com/dvdesolve/glrpt.git")
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
