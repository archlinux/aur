# Maintainer: David Foucher <dev@tyjak.net>

pkgname=wego
pkgver=2.2
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('80c35be31219cdefb286978d2118309bc0238b49352b861e28b2dac39f49edba8e2c74bfd1d1549d918307584b820345814953cce757d9d42a2191b8cb44cb47')

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
