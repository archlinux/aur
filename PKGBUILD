# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=peco-git
pkgver=0.3.5.r15.g1ccb24d
pkgrel=1
pkgdesc="Simplistic interactive filtering tool."
arch=('i686' 'x86_64')
url="https://github.com/peco/peco"
license=('MIT')
makedepends=('git' 'go')
provides=('peco')
conflicts=('peco')
_gourl="github.com/peco/peco/cmd/peco"

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}/"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  GOPATH=$srcdir go get -v -d -x $_gourl
  cd $srcdir/src/$_gourl
  GOPATH=$srcdir go build -o ../../../../../../peco
}

package() {
  cd "$srcdir"
  install -Dm755 peco "$pkgdir/usr/bin/peco"
  cd "$srcdir/src/github.com/peco/peco"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
}

