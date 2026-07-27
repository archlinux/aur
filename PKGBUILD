# Maintainer: Ghazi Wali <ghazi@hulios.org>
pkgname=hulios-git
pkgver=2.0.0.rc.2.r0.gc7b9ba2
pkgrel=1
pkgdesc="HULIOS - Rust-based transparent Tor proxy for Linux with full system traffic routing, DNS leak protection, and enhanced privacy"
arch=('x86_64' 'aarch64')
url="https://github.com/ghaziwali/Hulios"
license=('GPL3')
depends=('tor' 'libelf' 'zlib')
makedepends=('git' 'rust' 'cargo' 'clang' 'llvm')
provides=('hulios')
conflicts=('hulios')
source=("git+https://github.com/ghaziwali/Hulios.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Hulios"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Hulios"
  cargo build --release
}

package() {
  cd "$srcdir/Hulios"
  install -Dm755 "target/release/hulios" "$pkgdir/usr/bin/hulios"
}
