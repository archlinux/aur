# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=display3d
pkgver=0.2.3
pkgrel=1
pkgdesc='CLI for rendering and animating 3D objects'
arch=('x86_64')
url="https://github.com/renpenguin/$pkgname"
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1dd0cb10b75b125453d55f1385d0245d9ec14969eb29da74fa68de58772bd8fa')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

