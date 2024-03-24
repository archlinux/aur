# Maintainer: Alex Avance <aravance(at)gmail(dot)com>

_pkgname=volume-sync
pkgname=$_pkgname-git
pkgver=7.3d26107
pkgrel=1
pkgdesc="A utility for keeping volume in sync across multiple pulse volume sinks"
url="https://github.com/aravance/volume-sync"
depends=('libpulse')
makedepends=('cargo')
arch=('x86_64')
source=("volume-sync::git+https://github.com/aravance/volume-sync.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
}
