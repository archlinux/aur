# Maintainer: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top
pkgver=0.1.10
pkgrel=2
pkgdesc="Tool that shows AMD GPU utilization"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=("MIT")
depends=(
  "glibc"
  "libdrm"
)
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85da33a2c2e03ca2a97f02b5ed0913772860a8ede21e48039d17a8fe38de94b3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=1.69
	export CARGO_TARGET_DIR=target
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=1.69
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/amdgpu_top "$pkgdir/usr/bin/amdgpu_top"
	install -Dm644 assets/amdgpu_top.desktop "$pkgdir/usr/share/applications/amdgpu_top.desktop"
}
