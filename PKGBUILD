# Maintainer: Jan van den Berg <arch at koozz dot nl>

pkgname='mgit'
pkgdesc='Run git on multiple projects.'
pkgver=0.1.10
pkgrel=1
arch=('x86_64')
url='https://crates.io/crates/mgit'
license=('MIT')
depends=('git')
makedepends=('rust')
checkdepends=('rust' 'git')
provides=(mgit)
source=("$pkgname-$pkgver.tar.gz::https://github.com/koozz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8007e08059c9c97e07078beb59d3e37635b06b6a14cbecf7c237ea7f8f087681')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
