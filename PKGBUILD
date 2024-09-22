# Maintainer: David Foucher <dev@tyjak.net>

pkgname=wego
pkgver=2.3
pkgrel=2
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1e1944ac2f3e64622e419541c741e743a53bb5e321bb9fe5781f0fed635b5474f2fd2df5010222dfc0cff601f1aa3f194326b1f688aebf3f3c41f6d419e491e4')

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
