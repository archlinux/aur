# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="apx-git"
_pkgname="apx"
pkgver=1.4.0.r13.gd6805ba
pkgrel=1
pkgdesc="Vanilla OS package manager"
arch=('x86_64')
url="https://github.com/Vanilla-OS/apx"
license=('GPL3')
depends=(
  'pacman>5'
  'git'
  'distrobox'
  )
makedepends=('go>=1.17')
options=(!lto)
conflicts=('apx')
provides=('apx')
source=(
  'apx::git+https://github.com/Vanilla-OS/apx.git#branch=main'
  'config.json'
  )
sha256sums=(
  'SKIP'
  '972073c7a632d624091ab4b1f88b761ac3309ee137bef53de33e543154502e71'
  )

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  go build -o apx main.go
}

package() {
  install -Dm755 "$srcdir/$_pkgname/apx" "$pkgdir/usr/bin/apx"
  install -Dm644 "$srcdir/$_pkgname/man/apx.1" "$pkgdir/usr/share/man/man1/apx.1"
  install -Dm644 "$srcdir/$_pkgname/man/es/apx.1" "$pkgdir/usr/share/man/es/man1/apx.1"

  install -Dm644 "$srcdir/config.json" "$pkgdir/etc/apx/config.json"
}
