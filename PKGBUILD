# Maintainer: Willy Micieli <micieli at vivaldi.net>
# Contributor: Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=7.2.0
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'rsbadges' 'wget' 'git' 'docker-compose' 'ncurses' 'cargo-audit')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('cbfd41adfa67602a8417e1e6275e98c226e3f950cf3e97cfe118e27c2aca8fd1')

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
