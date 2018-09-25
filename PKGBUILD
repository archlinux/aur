# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.15.6
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/genuinetools/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3ca73c4f95495db459c9771e8d4a85e4709fcaea3e37f626d71169a85e9bf1302644a28cc2a406cd6acfea40c25e9cd23ae2bbd4552860ec7233c96b27540b93')

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
