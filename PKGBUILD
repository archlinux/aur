# Maintainer:  aik2 <code at lejun dot site>

pkgname=chuckfmt
pkgver=0.2.2
pkgrel=1
pkgdesc='A fast code formatter => ChucK programming language'
arch=('x86_64' 'aarch64')
url='https://github.com/aik2mlj/chuckfmt'
license=('MIT')
depends=('clang')
makedepends=('cargo' 'git')
provides=($_name)
conflicts=($_name)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea93d55ed60b3147ead9aa35762682843ab78428db5ffc5f8e431511c2877d19')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "$CARGO_TARGET_DIR/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # License
    install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
