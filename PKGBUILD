# Maintainer: Hieu Nguyen <hieunx@outlook.com>
pkgname=view-launcher-git
_pkgname=view-launcher
pkgver=r4.7a1b2c3
pkgrel=1
pkgdesc="A minimalist, high-performance terminal TUI app & file launcher in Rust for Sway/Wayland/X11"
arch=('x86_64')
url="https://github.com/hieunx1024/view-launcher"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('view-launcher')
conflicts=('view-launcher')
source=("git+https://github.com/hieunx1024/view-launcher.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  CARGO_PROFILE_RELEASE_LTO=true cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
