# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.15.3
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/genuinetools/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5f1f8803f7ffbc982282daa2dff3a6c6a343e1459256d13049bfab6c1b90d87ecab2eae74f95969b68bee43b2d3f4a6bd8c896179b016e18d11fc0dabf3510c5')

prepare() {
  mkdir -p src/github.com/genuinetools
  ln -rsnf weather-$pkgver src/${url#*//}
}

build() {
  cd src/${url#*//}
  export GOPATH="$srcdir"
  go build -v
}

package() {
  cd weather-$pkgver
  install -Dm755 weather "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
