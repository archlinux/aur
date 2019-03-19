# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=6cord
pkgver=6.1
pkgrel=1
pkgdesc='Discord, TUI and SIXEL.'
arch=('x86_64')
url="https://gitlab.com/diamondburned/6cord"
license=('MPL-2.0')
makedepends=('go-pie')
source=("https://gitlab.com/diamondburned/6cord/-/archive/stable-$pkgver/6cord-stable-$pkgver.tar.gz")
sha256sums=('9da3578ef1dc28603c53bbe72a812cb520efe6d6ca77ed0be8c6df0d57fedfec')
conflicts=('6cord-git')

build() {
  cd $pkgname-stable-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-stable-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/6cord
}
