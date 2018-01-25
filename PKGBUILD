# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.13.0
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/jessfraz/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9023e47e97e04510677da5c85f38bcd9bed4f2111c2a40ff6117b37eb73bf16c290c7c8dc4e89f44e508a9593b5d5369ed5281db1d9033e32a6fa3ac60f24ef0')

prepare() {
  mkdir -p src/github.com/jessfraz
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
