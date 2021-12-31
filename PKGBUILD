# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20211231
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha512sums=('f94d98624f2a2c284c0741f011f8c9c55075e4ad254b403bcd4d4a552d04cd416761fa8e6af30a3a8c3432bfd58f400b8bce1b03fc1b6b1c71ad8dcb4fa86ffd')
depends=('openmpi')

prepare() {
  # https://github.com/stephaneguindon/phyml/issues/156#issuecomment-949475758
  cd "${pkgname%-mpi}-$pkgver"
  sed -i '/^AM_INIT_AUTOMAKE$/d' configure.ac
}

build() {
  cd "${pkgname%-mpi}-$pkgver"
  ./autogen.sh
  autoreconf -i
  ./configure --prefix=/usr --enable-phyml-mpi
  make
}

package() {
  cd "${pkgname%-mpi}-$pkgver"
  make DESTDIR="$pkgdir" install
}
