# Maintainer: Mopi <mopi@dotslashplay.it>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=play.it
pkgver=2.12.2
pkgrel=1
pkgdesc="Easy way to install games on Linux"
arch=('any')
url="https://wiki.dotslashplay.it"
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
sha256sums=('2da413de5af44677c0517708a8af2bf876b115cff686186c951b3adae3c6602d')

build() {
  cd scripts-$pkgver
  make
}

package() {
  cd scripts-$pkgver
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

