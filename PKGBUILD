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
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-v$pkgver"

    rustup override stable
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    find templates -type f -exec install -Dm 700 "{}" "${pkgdir}/home/$user/.local/share/$pkgname/{}" \;
}