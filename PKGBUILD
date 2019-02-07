# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ethr-git
pkgver=v0.2.1.r4.gf5c8cd8
pkgrel=1
pkgdesc="Ethr is a Network Performance Measurement Tool for TCP, UDP & HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Microsoft/ethr"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("${pkgname}::git+https://github.com/Microsoft/ethr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  # Install deps
  go get github.com/nsf/termbox-go

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/ethr"
}
