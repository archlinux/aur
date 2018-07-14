# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_commit=6f7b2f4b18f85766b6199b574f42c72ef4539c45
pkgname=wego
pkgver=2.0.r33.g6f7b2f4
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('7a08d724f30f2d2d76e817ff384f5e0e159d037ee231550a57449f9d926bdd95bbfeb9963b34befcacb1e4c98e66eba41e6a8b41678fd14f696fe2f659661cdb')

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
