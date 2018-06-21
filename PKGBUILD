# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20180621
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha256sums=('a66c1c5758408578c34a17733f92db11a67aa572a06a9b5e3046009ee8bed0d3')
depends=('openmpi')

build() {
  cd "${pkgname%-mpi}-$pkgver"
  aclocal
  autoreconf --force --install
  automake --force --add-missing
  ./configure --prefix=/usr --enable-mpi
  make
}

package() {
  cd "${pkgname%-mpi}-$pkgver"
  make DESTDIR="$pkgdir" install
}
