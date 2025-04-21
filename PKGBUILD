# Maintainer: Jadelynn Cheatum <jcheatum@tuta.com>
pkgname=rmup
pkgver=0.10.2
pkgrel=1
pkgdesc="A TUI music player written in Rust"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://codeberg.org/jcheatum/rmup"
license=('MPL-2.0')
groups=()
depends=(glibc gcc-libs alsa-lib)
makedepends=(cargo)
provides=("$pkgname")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
md5sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 'target/release/rmup' "$pkgdir/usr/bin/rmup"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
