# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=ghq
pkgver=0.7.4
pkgrel=1
pkgdesc="Manage remote repository clones"
arch=('i686' 'x86_64')
url="https://github.com/motemen/ghq"
license=('MIT')
makedepends=('go' 'git')
source=("ghq-${pkgver}.tar.gz::https://github.com/motemen/ghq/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go get -t -d -v
  go build
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 ghq-$pkgver "$pkgdir/usr/bin/ghq"
  install -Dm 644 zsh/_ghq "$pkgdir/usr/share/zsh/site-functions/_ghq"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/ghq/LICENSE"
}

# vim: set et sw=2 sts=2:

sha512sums=('1c8e9b433061940133805b0cdd7db26f3a1be801cb196acdca6d56a1dac0a2b412296cbc69d6e2fc0b784d6951d906b3da5dc7f11a02bd22d3d15c2e7fc87227')
