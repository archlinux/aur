# Maintainer: Denis Benato <benato.denis96@gmail.com>

pkgname=atomrootfsinit
pkgver=0.7.5
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
    "573b3fef91db9bb202950adfcbc3dffb9d4eb4422753e4a26fcd12931aba984d0b93c5928c2a90a1c748b159bbb7cf77266d5cc92497dc2656a651ab8120c080"
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
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
