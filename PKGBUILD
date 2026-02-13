# Maintainer: Moogoesmeow moogoesmeow123@gmail.com

pkgname="dibble"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="A quick and local cli tool for word definitions"
arch=(any)
source=("https://github.com/moogoesmeow0/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("SKIP")
makedepends=(cargo)
depends=('gcc-libs')
license=('MIT' 'custom')
url="https://github.com/moogoesmeow0/dibble"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # install dict files
    install -dm755 "$pkgdir/usr/share/dibble/dict"
    cp -r dict/* "$pkgdir/usr/share/dibble/dict/"
    
}
