# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.10.0
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/jessfraz/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b5e10f9a4d88ff1c24f98ff821c70ea4b252ab8de80b9ff1b4a0717704c18f77eb1985e88820b6345fbf9774dddaebaffb38bce8eaf5137170baa90844043138')

prepare() {
  mkdir -p src/github.com/jessfraz
  ln -rsnf weather-$pkgver src/${url#*//}
}

build() {
  cd weather-$pkgver
  export GOPATH="$srcdir"
  go build -v ...
}

package() {
  cd weather-$pkgver
  install -Dm755 weather "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
