# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kitty-img
pkgver=1.1.0
pkgrel=1
pkgdesc='Print images inline in kitty'
arch=('aarch64' 'armv7h' 'i686' 'pentium4' 'x86_64')
url='https://git.sr.ht/~zethra/kitty-img'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/kitty-img/archive/$pkgver.tar.gz")
b2sums=('9161017e6ae41e3d0ad69701f053f27e7d4d6da1ea97c01ce43ad63473aefc646a64c194c881db7bef95d896ddd4ac6adb389db0afbdaebc4c2ee9aae5c4f5f3')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
