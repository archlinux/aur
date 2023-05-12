# Maintainer: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top
pkgver=0.1.8
pkgrel=1
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
sha256sums=('07b27790478be376b11f1623606865d55fea6548609f353e007fe89c9581ae0f')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/amdgpu_top "$pkgdir/usr/bin/amdgpu_top"
	install -Dm644 assets/amdgpu_top.desktop "$pkgdir/usr/share/applications/amdgpu_top.desktop"
}
