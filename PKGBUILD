# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20211231
pkgrel=2
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha512sums=('6b6ecbb3781aada945c6483660b868c978b9ec2b5501ee04b117a7c0011cf4b8d5dac46ad48455ba8edd6c52fabff3598d0d738ba12d50fe57442521a17bf50f')
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
