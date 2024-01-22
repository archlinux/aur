# Maintainer  : Willy Micieli <micieli@vivaldi.net>
# Contributor : Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=2.0.1
pkgrel=1
pkgdesc="A continuous integration testing project"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'libnotify' 'curl' 'fuse-overlayfs' 'less' 'rustup' 'fd' 'git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('59b58af83b6c2f1d7a3711a591ac032854742197558da0ba9af1f39d05f078a4')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/again"
}
