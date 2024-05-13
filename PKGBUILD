# Maintainer: John Regan <john@jrjrtech.com>

pkgname=lightningcss
pkgver=1.24.1
pkgrel=1
pkgdesc='An extremely fast CSS parser, transformer, bundler, and minifier written in Rust.'
url='https://lightningcss.dev/'
arch=('i686' 'x86_64')
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/parcel-bundler/lightningcss/archive/v${pkgver}.tar.gz")
sha256sums=('d6a6bb9c51c98878e365deaf5477c22da5be29fc2a975abdda9d255e116ae268')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --features "cli" --release --frozen

}

check() {
    cd "$pkgname-$pkgver"
    cargo test --features "cli" --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

