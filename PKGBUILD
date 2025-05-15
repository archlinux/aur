# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=tuckr
_pkgname=Tuckr
pkgver=0.11.2
pkgrel=1
pkgdesc="A super powered replacement for the GNU Stow dotfile manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/RaphGL/Tuckr"
license=('GPL-3.0-only')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
source=("$url/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b29390eba7a8afc76d553482a513b7bdc76363b6e2f3452048e3ee2110300226')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"    
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check(){
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
