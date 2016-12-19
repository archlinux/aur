# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=wego
pkgver=2.0
pkgrel=3
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('any')
license=('ISC')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('92073393f420f72367955b08ef64a90eadc5a72f79f9c42ee1886918923e5953da15dd9ffaefc14aa444cfe5db5f903d88ec080f9ca3490da29efe5734a200f8')

prepare() {
  mkdir -p src/github.com/schachmat
  ln -rsnf wego-$pkgver src/${url#*//}
}

build() {
  cd wego-$pkgver
  export GOPATH="$srcdir"
  go get -u -v github.com/schachmat/ingo
  go get -u -v github.com/mattn/go-colorable
  go get -u -v github.com/mattn/go-runewidth
  go build -v
}

package() {
  cd wego-$pkgver
  install -Dm755 wego-$pkgver "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
