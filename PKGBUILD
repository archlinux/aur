# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.0.3
pkgrel=1
pkgdesc="Clipboard history manager for Wayland, inspired by cliphist"
arch=('x86_64')
url="https://github.com/rolv-apneseth/clipvault"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f62a0bedf985c41212297b6b456004cf2ed2cf43e065945faf20580fe8e1783972a986eedc03ac7fdf8521df61c42e5ca698fee846e072e605ba8bab2843f255')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package()
{
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
