# Maintainer: sapient_cogbag <sapient_cogbag at protonmail dot com>
pkgname=rustcities-git
pkgver=v1.0.0.r1.f5605aa
pkgrel=1
pkgdesc="Neocities API client written in rust"
arch=('any')
url="https://gitlab.com/sapient_cogbag/rustcities"
license=('GPL3')
makedepends=('git' 'cargo')
provides=("rustcities")
conflicts=("rustcities")
source=('rustcities-git::git+https://gitlab.com/sapient_cogbag/rustcities.git#branch=main')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/rustcities-git"
    # Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/rustcities-git"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/rustcities-git"
    
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/rustcities-git"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$srcdir/rustcities-git"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/rustcities" 
}
