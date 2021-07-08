# Maintainer: Mopi <mopi@dotslashplay.it>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=play.it
pkgver=2.13.2
pkgrel=1
pkgdesc="Easy way to install games on Linux"
arch=('any')
url="https://www.dotslashplay.it"
license=('BSD')
depends=('bash')
makedepends=('pandoc')
optdepends=(
  'imagemagick: to convert images between formats'
  'libarchive: to extract various archive formats'
  'icoutils: to manipulate Windows icon files'
  'innoextract: to extract some Windows installers'
  'unzip: to extract some archives'
)
source=("${pkgname}-${pkgver}.tar.gz::https://forge.dotslashplay.it/play.it/scripts/-/archive/${pkgver}/scripts-${pkgver}.tar.gz")
sha256sums=('c475a1dc104e812022018ef1fb2d9561dab5d6fa3609f02360926ab8739ba9b8')

build() {
  cd scripts-$pkgver
  make
}

package() {
  cd scripts-$pkgver
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

