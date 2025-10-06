# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=darklua-git
pkgver=v0.17.2
pkgrel=1
pkgdesc='Transform Lua 5.1 and Roblox Luau code using configurable rules.'
arch=('x86_64')
url='https://github.com/seaofvoices/darklua'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "darklua"
	git describe --tags | sed 's/-/./g'
}

build() {
    cd "darklua"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "darklua"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "darklua"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/darklua"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
