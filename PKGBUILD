# Maintainer: Exbets
pkgname=wally-git
pkgver=nightly.50.r50.gf578078
pkgrel=1
pkgdesc="A package manager for Roblox projects inspired by Cargo"
arch=('x86_64')
url="https://github.com/UpliftGames/wally"
license=('Apache-2.0' 'MIT')
depends=('rust')
makedepends=('git' 'cargo')
conflicts=('wally')

source=("git+https://github.com/UpliftGames/wally.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wally"
    git describe --long --tags | sed 's/\([^-]*-\)g/\1r&/;s/-/./g'
}

build() {
    export CFLAGS="-fPIC"
    export OPENSSL_STATIC=0
    cd "$srcdir/wally"
    cargo build --release
}

package() {
    install -Dm755 "$srcdir/wally/target/release/wally" "$pkgdir/usr/bin/wally"
    install -Dm644 "$srcdir/wally/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}