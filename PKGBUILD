# Maintainer: XandrCopyrighted <xxandrr at proton dot me>

pkgname=xfetch-rs-git
pkgver=1.0
pkgrel=1
pkgdesc="The world's fastest & simplest fetch written in Rust."
arch=('any')
url="https://github.com/XandrCopyrighted/xFetch/"
license=('MIT')

source=(git+https://github.com/XandrCopyrighted/xFetch.git)
sha256sums=('SKIP')

depends=()
makedepends=('git' 'rustup')
provides=("xfetch-rs")
conflicts=("xfetch-rs")
pkgver() {
  cd $srcdir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir
  rustup default nightly-2024-01-20
  rustup component add rust-src --toolchain nightly-2024-01-20-x86_64-unknown-linux-gnu
  RUSTFLAGS="-Zlocation-detail=none" cargo build --target x86_64-unknown-linux-gnu --profile optimized-build -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort
}

package() {
	cd $srcdir
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm4755 target/x86_64-unknown-linux-gnu/optimized-build/xfetch "$pkgdir/usr/bin/xfetch"
}
