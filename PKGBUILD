# Maintainer: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=6cord-git
pkgver=1.r74.gc167ba3
pkgrel=1
pkgdesc='Discord, TUI and SIXEL.'
arch=('x86_64')
url="https://gitlab.com/diamondburned/6cord"
license=('MPL-2.0')
makedepends=('go-pie')
source=("$pkgname::git+https://gitlab.com/diamondburned/6cord")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^stable.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
