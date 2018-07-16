# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.15.5
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/genuinetools/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('22166649e5c8b24b387c750fb603f06de065998c859f402769917eb0546d46a0b3fb2666cf0146345ce1e3f44f46b4fb582666e637a4b682bbc318eb1f0218e8')

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
