# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml-mpi
pkgver=3.3.20260528
pkgrel=1
epoch=1
pkgdesc='Builds phylogenies from DNA or protein sequences using a maximum likelihood approach, using multiple processors'
arch=('i686' 'x86_64')
url='https://github.com/stephaneguindon/phyml'
license=('GPL-3.0-only') # unclear if -only or -or-later
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephaneguindon/phyml/archive/v${pkgver}.tar.gz")
sha512sums=('ca2cd128852842d4b4100f801e1edff90bb3ee920519d4169c126fa4fedfe18eb0be2ebf88556add08bf881e2572eb8d6d023be280336e11d3a4709a91a5b07c')
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
