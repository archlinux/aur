# Maintainer: Luxzi <luxzi@pm.me>
pkgname=newpr
pkgver=0.1.1
pkgrel=1
pkgdesc="Automate the creation of new programming projects"
arch=('any')
url="https://gitlab.com/luxzi/$pkgname"
license=('GPL')
depends=('python')
makedepends=('rustup')
provides=("$pkgname")
source=("https://gitlab.com/luxzi/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=("SKIP")

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo build --release
}

package() {
    cd "$pkgdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-v$pkgver/target/release/$pkgname"

    cd "$srcdir/$pkgname-v$pkgver"
    find templates -type f -exec install -Dm 700 "{}" "${pkgdir}/home/$USER/.local/share/$pkgname/{}" \;
}