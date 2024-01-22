# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=mask
pkgver=0.11.4
pkgrel=1
pkgdesc='A CLI task runner defined by a simple markdown file'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jakedeichert/mask"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/mask/$pkgver.tar.gz")
sha256sums=('65ac7b5798bc717a2a0c3fb933afab45fc901eeb3ff299e03695bf3204d4f37a')

prepare() {
    cd mask-$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd mask-$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd mask-$pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
