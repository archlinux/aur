# Maintainer: Mopi <mopi@dotslashplay.it>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=play.it
pkgver=2.12.1
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
sha256sums=('8cc88fb18d60b36309e5ec1597b0f6658783976a8357b154fbcfa41ad02f7297')

build() {
  cd scripts-$pkgver
  make
}

package() {
  cd scripts-$pkgver
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

