# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=ion
pkgname=$_pkgname-git
pkgver=r912.2e4bd37
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux. (Git version)"
arch=("x86_64" "i686")
url="https://github.com/redox-os/ion"
license=('MIT')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=ion-git.install
source=('git+https://github.com/redox-os/ion.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  cargo build --release
}

check() {
  cd $srcdir/$_pkgname
  cargo test
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 target/release/ion $pkgdir/usr/bin/ion
}
