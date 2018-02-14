# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20180214
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha256sums=('ec059e3662874be3fdf1a9dc6d71fe4d568d987f66da9495f154f8f49c6d153e')
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
