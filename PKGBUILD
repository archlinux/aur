# Maintainer: Denis Benato <benato.denis96@gmail.com>

pkgname=atomrootfsinit
pkgver=0.7.0
pkgrel=1
pkgdesc=''
url='https://github.com/NeroReflex/atomrootfsinit'
license=("GPLv2")
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
    "https://github.com/NeroReflex/AtomButter/archive/refs/tags/$pkgver.tar.gz"
)
b2sums=(
    "172be78a566e680205fb3acc38e03c7e4959053045c0db54d82eae65b863ebf5878682ec5b561e233dae7ea121eb4b388ddf64b4fd3f72ddc962b7267cc11c1a"
)

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/$pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/$pkgname-$pkgver
    cargo build --frozen --release --all-features
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    # for custom license, e.g. MIT
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
