# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=8.0.0
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu' 'pre-commit')
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'rsbadges' 'wget' 'ncurses' 'cargo-audit')
optdepends=('git: git support' 'mercurial: mercurial support' 'docker-compose: docker-compose support')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('39546bb342bec95a20cffa6dc42b043d77f6dce1a5b7aa7b276d6e2de9143b15')

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
    install -Dm0755 -t "$pkgdir/usr/bin/" "pre-commit"
}
