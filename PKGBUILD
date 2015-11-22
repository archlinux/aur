# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=ghq
pkgver=0.7.1
pkgrel=1
pkgdesc="Manage remote repository clones"
arch=('i686' 'x86_64')
url="https://github.com/motemen/ghq"
license=('MIT')
makedepends=('go' 'git')
source=("ghq-${pkgver}.tar.gz::https://github.com/motemen/ghq/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build"
  go get -t -d -v
  go build
}

check() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 ghq-$pkgver "$pkgdir/usr/bin/ghq"
  install -Dm 644 zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha1sums=('424af3889e4781423d35d3bea1ec9812067808f7')
