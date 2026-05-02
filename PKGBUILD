# Maintainer: Manpreet <manpreet@example.com>
pkgname=ax-git
pkgver=1.1.0.r0.g7b657b5
pkgrel=1
pkgdesc="A fast, unified, and feature-complete wrapper for pacman and the AUR"
arch=('x86_64')
url="https://github.com/Manpreet113/ax"
license=('MIT')
depends=('pacman' 'git')
makedepends=('cargo' 'git')
provides=('ax')
conflicts=('ax' 'ax-bin')
source=("git+https://github.com/Manpreet113/ax.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ax"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/ax"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$srcdir/ax"
  install -Dm755 "target/release/ax" "${pkgdir}/usr/bin/ax"
}
