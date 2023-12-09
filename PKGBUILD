# Maintainer: Timo Kettenbach
pkgname=borrg
pkgver=0.1.1
pkgrel=1
pkgdesc="A borg wrapper written in rust"
url="https://github.com/SebastianSpeitel/borrg"
license=("Apache-2.0" "Apache-2.0-with-LLVM-exceptions" "Boost-1.0" "MIT" "Unlicense")
arch=("x86_64" "armv7h" "aarch64" "pentium4" "i686")
depends=('borgbackup')
makedepends=('rust>=1.65')
provides=("borrg")
conflicts=("borrg-bin")
source=("https://github.com/SebastianSpeitel/borrg/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('ba823f9a9bd9010198d01aa2d83f18861e1517a99286dff068114ea0a231ffba')

prepare() {
	cd "$pkgname-v.${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-v.${pkgver}"
	cargo build --release --frozen --all-targets
}

package() {
	cd "$pkgname-v.${pkgver}"
    install -Dm755 target/release/borrg -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
