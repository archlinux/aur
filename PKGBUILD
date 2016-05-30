# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.2.0
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple proccessors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPLv2')
source=("https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha256sums=('9fec8fc26e69cad8d58bf2c9433b531754e4f026dc3464d07958b6c824783fde')
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
