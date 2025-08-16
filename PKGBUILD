# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20250515
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple processors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL-3.0-only') # unclear if -only or -or-later
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha512sums=('fcd8b58b27af6fbe610e429712909f4f600bfcd1255682092d2a63fee342cce763c1941c327f90a726ef196cc8b52377d747d1b2ec64c63b0dc7ce1788c94baf')
depends=('openmpi')

build() {
  cd "${pkgname%-mpi}-$pkgver"
  autoupdate
  autoreconf --force --install -v
  ./configure --prefix=/usr --enable-phyml-mpi
  make
}

package() {
  cd "${pkgname%-mpi}-$pkgver"
  make DESTDIR="$pkgdir" install
}
