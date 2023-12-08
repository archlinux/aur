# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20220408
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple processors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha512sums=('039543ebdff8c33c7b30212f6d08883a757f00711e4e051e047b0c7971de5980171198fed7a4638117968d05b203c828e71a694294394e3d1d173f131b9d4580')
depends=('openmpi')

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
