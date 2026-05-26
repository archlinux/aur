# Maintainer: George Green <iamkarlson@gmail.com>

pkgname=abtop
pkgver=0.4.5
pkgrel=1
pkgdesc='AI agent monitor for your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/graykode/abtop'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graykode/abtop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aab79fb05cae990867075f0c6cac7ee11aaa2a4028c4e8942176f3b4262b2085')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
