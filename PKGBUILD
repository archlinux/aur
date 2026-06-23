# Maintainer: BitsBob <audeygodfrey@gmail.com>
pkgname=wikiosophy
pkgver=1.0
pkgrel=1
pkgdesc="CLI that follows the first body link of a Wikipedia article until it reaches Philosophy"
arch=('x86_64')
url="https://github.com/BitsBob/wikiphilosophy"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('cargo')
_reponame=wikiphilosophy
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e95a304f4de127bdcd5fc799765368a35d922dc7e8a74e0aafefca380cabea69')

prepare() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_reponame-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
