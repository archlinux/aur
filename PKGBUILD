# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=tardisgo
pkgver=0.1
pkgrel=2
pkgdesc='Create mobile applications with Go, by transpiling to Haxe'
arch=('x86_64' 'i686')
url='http://tardisgo.github.io/'
license=('MIT')
makedepends=('go' 'git')
depends=('haxe')
source=("git://github.com/tardisgo/tardisgo.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  export GOPATH="$srcdir"
  go get golang.org/x/tools/go 2>/dev/null || true
}

build() {
  export GOPATH="$srcdir"
  go get -u github.com/tardisgo/tardisgo
  rm -rf "$srcdir/src/github.com/tardisgo/tardisgo"
  mv tardisgo "$srcdir/src/github.com/tardisgo/"
}

package() {
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "src/github.com/$pkgname/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
