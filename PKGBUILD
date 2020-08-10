# Maintainer: Mopi <mopi@dotslashplay.it>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=play.it
pkgver=2.12.0
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
sha256sums=('413f2ffb7af50e44c03abc04bade37494eb47b936c8ef7bee01872b71c371549')

prepare() {
  cd scripts-$pkgver
  sed -i '/DEFAULT_OPTION_PREFIX/s,=.*,=/usr,' play.it-2/src/99_init.sh
  sed -i '/PATH_DESK/s,=.*,=/usr/share/applications,' play.it-2/src/99_init.sh
  sed -i '/PATH_ICON_BASE/s,=.*,=/usr/share/icons/hicolor,' play.it-2/src/99_init.sh
}

build() {
  cd scripts-$pkgver
  make
}

package() {
  cd scripts-$pkgver
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

