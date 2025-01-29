# Maintainer: Owen Harris <owen at harrisowe dot me>

pkgname="typing_test"
pkgver="1.0.3"
pkgrel=1
pkgdesc='Simple typing test for terminal written in rust'
url='https://github.com/owenhar/rust_typing_test'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('typing_test::git+https://github.com/owenhar/rust_typing_test.git#branch=main')
sha256sums=('SKIP')
# b2sums=()

prepare() {
    cd typing_test
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd typing_test
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    # install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 "$srcdir/typing_test/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "$srcdir/typing_test/words.txt" "$pkgdir/etc/words.txt"

    # for custom license, e.g. MIT
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
