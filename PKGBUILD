# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Frikilinux <frikilinux@gmail.com>

pkgname=transg-tui-git
pkgver=r28.3d06006
pkgrel=3
pkgdesc='Transmission remote TUI client'
arch=(x86_64)
url=https://github.com/PanAeon/transg-tui
license=(MIT)
makedepends=(cargo git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target --all-features
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target
}

package() {
  #install -Dm755 $pkgname/target/release/transgression-tui -t "$pkgdir/usr/bin"
  install -Dm755 $pkgname/target/release/transgression-tui "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
