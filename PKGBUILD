# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=tsfh
pkgver=0.56.0
pkgrel=1
pkgdesc="CHANGEME_DESC"
arch=('x86_64')
url="https://github.com/Obscurely/tsfh"
license=('GPL3')
makedepends=('git' 'rust' 'cargo' 'binutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-stable.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/tsfh-$pkgver-stable"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/tsfh-$pkgver-stable"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$srcdir/tsfh-$pkgver-stable"
  cargo test --frozen
}

package() {
  cd "$srcdir/tsfh-$pkgver-stable"
  install -Dm 755 "target/release/tsfh" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/tsfh.desktop"
  for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/tsfh.png" \
			"$pkgdir/usr/share/icons/hicolor/$size/apps/tsfh.png"
	done
}
