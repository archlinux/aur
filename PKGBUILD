# Maintainer: Imperator Storm <imperatorstorm@protonmail.com>

pkgname=repak
pkgver=0.2.3
pkgrel=2
pkgdesc='Unreal Engine .pak file library and CLI in rust'
url='https://github.com/trumank/repak'
license=('Apache-2.0' 'MIT')
makedepends=('cargo' git)
depends=(glibc libgcc)
options=(!lto)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(git+https://github.com/trumank/repak#tag=v$pkgver)
sha256sums=('2ec9119bdc58cbdede7f2ebfcc1d0a8324c587918bbe3fdf880d5af252fd26cb')

prepare() {
	cd $srcdir/repak
    cargo fetch --locked --target host-tuple

}

build() {
	cd $srcdir/repak
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
	cd $srcdir/repak
    cargo test --frozen --all-features
}

package() {
	cd $srcdir/repak
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/repak"
}
