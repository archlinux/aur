# Maintainer: Hans-Peter Deifel <hpd@hpdeifel.de>
pkgname=aurs-git
pkgver=0.5.0.r0.g06fdbe5
pkgrel=1
pkgdesc="An AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hpdeifel/aurs"
license=('GPL3')
provides=('aurs')
depends=('sudo' 'ranger' 'git' 'pacman')
makedepends=('cargo' 'clang')
conflicts=('aurs')
source=("$pkgname::git+https://gitlab.com/hpdeifel/aurs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  cargo build --release
}

package() {
  cd "$pkgname"

  install -D "target/release/aurs" -t "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
