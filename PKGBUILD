# Maintainer: Luxzi <luxzi@pm.me>
pkgname=newpr
pkgver=0.1.8
pkgrel=1
pkgdesc="Automate the creation of new programming projects"
arch=('any')
url="https://gitlab.com/luxzi/$pkgname"
license=('GPL')
depends=()
optdepends=('python: python script support')
makedepends=('rustup')
provides=("$pkgname")
source=("https://gitlab.com/luxzi/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    cargo build --release
}

package() {
    cd "$pkgdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-v$pkgver/target/release/$pkgname"

    cd "$srcdir/$pkgname-v$pkgver"
    find templates -type f -exec install -Dm0755 "{}" "${pkgdir}/home/$USER/.local/share/$pkgname/{}" \;
}
