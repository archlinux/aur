# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20200621
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha256sums=('a8243923ee08c74cab609a4b086ade66c6156fc2b24450e2a500108dc644c867')
depends=('openmpi')

build() {
  cd "${pkgname%-mpi}-$pkgver"
  ./autogen.sh
  autoreconf -i
  ./configure --prefix=/usr --enable-mpi
  make
}

package() {
  cd "${pkgname%-mpi}-$pkgver"
  make DESTDIR="$pkgdir" install
}
