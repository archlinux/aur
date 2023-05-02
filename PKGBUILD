# Maintainer: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top
pkgver=0.1.7_stable
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v0.1.7-stable.tar.gz")
sha256sums=('6a7e1bfeffd51fff4925d7bd166e9023970533b2d856ea82e145322fe6955acd')

prepare() {
    cd "$srcdir/$pkgname-0.1.7-stable"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-0.1.7-stable"
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-0.1.7-stable"
	install -Dm755 target/release/amdgpu_top "$pkgdir/usr/bin/amdgpu_top"
	install -Dm644 assets/amdgpu_top.desktop "$pkgdir/usr/share/applications/amdgpu_top.desktop"
}
