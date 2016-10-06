# Maintainer: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=lf
pkgver=nightly
pkgrel=1
pkgdesc='lf: A terminal file manager, heavily inspired by ranger'
arch=('i686' 'x86_64')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
makedepends=('go')
options=('!strip' '!emptydirs')
provides=('lf')
source=("https://github.com/gokcehan/lf/archive/$pkgver.tar.gz")
sha256sums=('ec0548d2169ef7748d8e9922c814adc4d445eb4886f6e8a51e90f5fff5ed7d90')

prepare() {
  # Get lf's Go dependencies
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get github.com/nsf/termbox-go
}

build() {
  # Build lf's binary
  export GOPATH="$srcdir/go"
  cd "lf-$pkgver"
  go build
}

package() {
  cd "lf-$pkgver"
  install -Dm755 "lf-$pkgver" "$pkgdir/usr/bin/lf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lf/LICENSE"
}
