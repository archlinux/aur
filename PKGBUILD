# Maintainer: 5c0 <admin@5c0.io>
pkgname=metropolis-git
_pkgname=metropolis
pkgver=0.1.0.r0.gfe6c284
pkgrel=1
pkgdesc="A cinematic, retro-cyberpunk system monitor for the terminal powered by Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/5c0/metropolis"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
