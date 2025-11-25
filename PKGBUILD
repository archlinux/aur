# Maintainer: Imperator Storm <imperatorstorm@protonmail.com>

pkgname=repak
pkgver=0.2.2
pkgrel=3
pkgdesc='Unreal Engine .pak file library and CLI in rust'
url='https://github.com/trumank/repak'
license=('Apache-2.0' 'MIT')
makedepends=('cargo' git)
depends=(glibc gcc-libs)
options=(!lto)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(git+https://github.com/trumank/repak#tag=v$pkgver)
sha256sums=('20dc367f1316ec56f4bd0379a85ae62a71ff1de1b768ae96758cf6bd2ced4528')

prepare() {
	cd $srcdir/repak
    cargo fetch --locked --target "$(rustc --print host-tuple)"

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
