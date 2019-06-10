# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=6cord
# https://gitlab.com/diamondburned/6cord/releases
pkgver=8.8
pkgrel=1
pkgdesc='Discord, TUI and SIXEL.'
arch=('x86_64')
url="https://gitlab.com/diamondburned/6cord"
license=('MPL-2.0')
makedepends=('go')
source=("https://gitlab.com/diamondburned/6cord/-/archive/stable-$pkgver/6cord-stable-$pkgver.tar.gz")
sha256sums=('31ab04425626d9d5f80f5f9f939f9198f345a7c84013182e23324caa1384259b')
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
