# Maintaner: Miguel Rodrigues <miguelangelorodrigues@enta.pt>

pkgname="sesame"
pkgver=0.1.0.r7.b533865
pkgrel=1
pkgdesc="An xdg-open alternative."
arch=(any)
url="https://github.com/green7ea/sesame"
license=('MIT')
makedepends=('rust' 'cargo')
provides=('sesame')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

package() {
  install -Dm755 "target/release/${pkgname}" -t "$pkgdir/usr/bin"
}
