# Maintainer: Mohammad Reza Karmi <m.r.karimi.j@gmail.com>

pkgname=css-inline
pkgver=0.19.1
pkgrel=1
pkgdesc="CSS inliner"
arch=('x86_64' 'aarch64')
url="https://github.com/Stranger6667/css-inline"
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(rust git)
source=("$pkgname::git+$url#tag=rust-v$pkgver")
b2sums=('5ad8c4d36deb281125f12f0006ba035c6f42184a0f29fe793aa479a9b0277365425760d08de49df18485c01a2b2c6d8a039d046bb730a0828c24c77fdbbdad25')
options=(!lto)

prepare() {
    cd "$pkgname/css-inline"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
}

build() {
    cd "$pkgname/css-inline"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname/css-inline"

    install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" ../LICENSE
}
