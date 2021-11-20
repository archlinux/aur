# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20211118
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha256sums=('6348e8c0b73f424a7e3315116c34fe864162235565ce2f5cf81b1a0d499ba177')
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
