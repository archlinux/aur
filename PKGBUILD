# Maintainer: sprobie
_pkgname=torrentz2
pkgname="$_pkgname-git"
pkgver=89b20b5
pkgrel=2
pkgdesc="Torrent file creator and editor with v1/v2/hybrid support in Rust"
arch=(x86_64)
url='https://codeberg.org/liliumstar/torrentz2'
license=('GPL3')
depends=('openssl')
makedepends=('cargo')
provides=(tz2)
conflicts=(tz2)
source=("git+https://codeberg.org/liliumstar/$_pkgname.git")
sha512sums=('SKIP')

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $_pkgname
    install -Dm755 -t "$pkgdir/usr/bin/" "target/x86_64-unknown-linux-gnu/release/tz2"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}

pkgver() {
    cd "$_pkgname"
    git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
