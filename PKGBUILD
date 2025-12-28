# Maintainer: Rejzi-dich <rejzidich@gmail.com>
pkgname=rushfetch
pkgver=1.0.1
pkgrel=1
pkgdesc="BLAZING fast system information tool written in BLAZING fast Rust with customizable themes and languages"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Rejzi-dich/rushfetch"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bd4482dba5d2bb415c58534fc4a1f437ffeedb4e71602d821c38cd5a5ad84548')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install default config to /etc
    install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "ЧИТАЙМЕНЯ.md" "$pkgdir/usr/share/doc/$pkgname/ЧИТАЙМЕНЯ.md"
}

# vim:set ts=4 sw=4 et:
