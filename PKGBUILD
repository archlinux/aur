# Maintainer: Minh Nguyen <aur dot chewing345 at passinbox dot com>
pkgname=linux-enable-ir-emitter-beta
_pkgname=linux-enable-ir-emitter
pkgver=7.0.0
pkgrel=1
pkgdesc="Provides support for infrared cameras that are not directly enabled out-of-the box on Linux"
arch=(x86_64)
url=https://github.com/EmixamPP/linux-enable-ir-emitter
license=('MIT')
makedepends=(
    cargo
    clang
)
depends=(
    gcc-libs
    glibc
)
conflicts=(
    chicony-ir-toggle
    linux-enable-ir-emitter-git
    linux-enable-ir-emitter
)
provides=(linux-enable-ir-emitter)
source=($_pkgname-$pkgver-beta.tar.gz::https://github.com/EmixamPP/$_pkgname/archive/refs/tags/$pkgver-beta.tar.gz)
sha256sums=('f87faadaaf85bcb3d49338d96cec07b972c960c04310b1c617259ca353501079')

build() {
    cd $_pkgname-$pkgver-beta
    cargo build --release
}

package() {
    cd $_pkgname-$pkgver-beta
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}