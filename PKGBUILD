# Maintainer: Willy Micieli <micieli at vivaldi.net>
# Contributor: Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=7.1.1
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'rsbadges' 'wget' 'git' 'docker-compose' 'cargo-audit')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('89cd3c5123d440360de40bb19bc1e8e20ef1b08f21bcd61c82db43ead62f00a1')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
