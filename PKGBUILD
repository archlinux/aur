# Maintainer: George Tsiamasiotis <george@tsiamasiotis.gr>

pkgname=urlcode
pkgver=1.1.0
pkgrel=1
pkgdesc='Percent-encoding on the command line'
arch=('x86_64')
url='https://github.com/gtsiam/urlcode'
license=('MPL-2.0')
depends=(
    glibc
    libgcc
)
makedepends=(
    cargo
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gtsiam/urlcode/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('988e1358b1519e78f6c2118d87da35c869c205b7cc706ff23c9ea540729a4fa2')

_srcdir="$pkgname-$pkgver"

export RUSTUP_TOOLCHAIN="stable"
export CARGO_TARGET_DIR="target"
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$_srcdir"

    cargo fetch --locked
}

build() {
    cd "$_srcdir"

    cargo build --frozen --release
}

check() {
    cd "$_srcdir"

    cargo test
}

package() {
    cd "$_srcdir"

    install -Dm0755 "target/$CARGO_BUILD_TARGET/release/$pkgname" -t "$pkgdir/usr/bin/"
}
