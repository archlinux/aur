# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=nispor
pkgver=2.0.2
pkgrel=2
pkgdesc='Unified interface for Linux network state querying'
arch=('x86_64')
url='https://github.com/nispor/nispor'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ed7da27df6dbf5d16a8de99de3b9a42090d25d2b427d1082e672bc4d32a5f11f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/npc "$pkgdir/usr/bin/npc"
}
