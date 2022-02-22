# Maintainer: David Foucher <dev@tyjak.net>

pkgname=wego
pkgver=2.1
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('80cc19ea34bdb536ab48ef6e074f86b58dab59f76270688ca2d4c562c5eb34f177597108f2159e6ef33ee2485c068a7904ddf7bf8d0b79cb825ca7b73b0fefa2')

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
  install -Dm755 wego "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
