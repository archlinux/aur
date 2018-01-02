# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.12.0
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/jessfraz/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('689300d65f1055764cc21aa5a8a1bf6368a9259da9c1945d51046340e304f99e2e23d01c102445647226b191629d3ce527b624db50bfaf72e933b557e973280d')

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
