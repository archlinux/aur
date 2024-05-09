# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=asciiworld-git
pkgver=23.12.1.g8d021b1
pkgrel=1
pkgdesc="ASCII world map and tools"
arch=('i686' 'x86_64')
url="https://uninformativ.de/git/asciiworld"
license=('MIT')
depends=('gd' 'shapelib')
makedepends=('git')
optdepends=('curl: Retrieving various data'
            'python: Additional tools, e.g. satellite tracking'
            'python-geographiclib: Geographic calculations, used by tools'
            'python-pyephem: Calculating satellite positions'
            'python-maxminddb: Reading GeoIP databases'
            'geoip-database-extra: An actual GeoIP database'
            'ncurses: For tput')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://uninformativ.de/git/asciiworld.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g; s|v||'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make DEFAULT_MAP=/usr/share/"${pkgname%-git}"/ne_110m_land.shp
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
