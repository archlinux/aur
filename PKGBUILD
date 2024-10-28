# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprlauncher'
pkgver=0.1.0
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$pkgname"
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nnyyxxxx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a97aa1ee86c571983ca6e441911289b460111c4e1ad3bf65298d4f91883b49d6')
makedepends=('rustup')
depends=('glibc' 'gcc-libs' 'gtk4')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$pkgver"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
