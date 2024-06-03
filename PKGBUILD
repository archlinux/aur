# Maintainer: John Regan <john@jrjrtech.com>

pkgname=lightningcss
pkgver=1.25.1
pkgrel=1
pkgdesc='An extremely fast CSS parser, transformer, bundler, and minifier written in Rust.'
url='https://lightningcss.dev/'
arch=('i686' 'x86_64')
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/parcel-bundler/lightningcss/archive/v${pkgver}.tar.gz")
sha256sums=('2d676632bbec5de73edab0108815bf3e4ceecf8810779e787ed0e3d125149601')

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

