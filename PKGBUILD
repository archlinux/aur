# Maintainer: David Foucher <dev@tyjak.net>

_commit=994e4f141759a1070d7b0c8fbe5fad2cc7ee7d45
pkgname=wego
pkgver=2.0.r48.g994e4f1
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('8ee2747f4a6a0655125fd197b40bea9cf6ae11728a68c35e08863906a54b195e16be932e007dfa9be61452b59503126c92b9785f467a5b38f4f6f6d3e12e71e4')

prepare() {
  mkdir -p src/github.com/schachmat
  ln -rsnf wego-$_commit src/${url#*//}
}

build() {
  cd wego-$_commit
  export GOPATH="$srcdir"
  go get -u -v github.com/schachmat/ingo
  go get -u -v github.com/mattn/go-colorable
  go get -u -v github.com/mattn/go-runewidth
  go build -v
}

package() {
  cd wego-$_commit
  install -Dm755 wego-$_commit "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
