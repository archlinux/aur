# Maintainer: Elizabeth Vatten Veiga <parajogapaladins@gmail.com>
pkgname=icebg-git
pkgver=r3.g313bbef
pkgrel=1
pkgdesc="Lightweight Wayland Wallpaper Setter"
url="https://github.com/HaruNashii/Icebg"
license=('MIT')
makedepends=('git' 'rust' 'cargo')
depends=('libgcc')
arch=('x86_64')
source=("git+https://github.com/HaruNashii/Icebg.git")
options=('!debug')
sha256sums=('SKIP')
provides=('icebg')
conflicts=('icebg')

pkgver() {
  cd "$srcdir/Icebg"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Icebg"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$srcdir/Icebg"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

# check() omitted; Reason: Upstream Project Doesn't Have Tests Yet

package() {
  cd "$srcdir/Icebg"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/icebg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
