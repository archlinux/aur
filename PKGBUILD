# Maintainer: KotanUA <seekgamer4@gmail.com>
pkgname=micro-top-git
_pkgname=Micro-top
pkgver=r3.feff24d
pkgrel=1
pkgdesc="A tiny cross-platform system monitor written in Rust"
arch=('x86_64')
url="https://github.com/KotanUA/Micro-top"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=("micro-top")
conflicts=("micro-top")
source=("git+https://github.com/KotanUA/Micro-top.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/Micro-top" "$pkgdir/usr/bin/micro-top"
}
