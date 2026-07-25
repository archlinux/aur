# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp-git
pkgver=0.1.0.r0.gABCDEFG
pkgrel=1
pkgdesc="Terminal Translation Tool (git version)"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("$pkgname::git+https://github.com/missercatos/ecapp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.1.0"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/ecapp "$pkgdir/usr/bin/ecapp"
}