pkgname=scrcpy-wrapper
pkgver=0.1.3
pkgrel=1
pkgdesc='A simple wrapper for scrcpy'
url='https://github.com/Bluemangoo/scrcpy-wrapper'
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('scrcpy')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bluemangoo/$pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('f02f05ee6d8e20a569191bfb490ecdfc3fafa8ad3f229350a05053ef752c58812930775be85c8ee01e24fb9aa8eb4ec167b8f6e7b7b833d83e01f25feaf43333')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
}
