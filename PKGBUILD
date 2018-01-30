# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20180129
pkgrel=2
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL2')
source=("https://github.com/stephaneguindon/phyml/archive/${pkgver}.tar.gz")
sha256sums=('9fe2158ca6dfdd08269b3890d6f5e35d4cbaef2f7c9be9ed3bd3af8209f4862b')
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
