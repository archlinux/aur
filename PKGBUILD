# Maintainer: Thomas Le Duc <dev@tleduc.de>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=rn
pkgver=0.1.0
pkgrel=2
pkgdesc='Rename files and directories.'
arch=('x86_64')
url='https://github.com/thled/rn'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d853e33480f05af2b7a396acc979b575b342856ccfd2ffc2d22f5f03ed991e78')

build() {
    cd "$pkgname-$pkgver/app"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$pkgname-$pkgver/app"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "app/target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
