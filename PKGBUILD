# Maintainer: Simon Barth <sb at b1t dot at>

pkgname=machfile-cli
pkgver=0.2.4
pkgrel=1
pkgdesc='Modern task runner written in rust'
arch=('x86_64' 'aarch64')
url=https://github.com/machfile/machfile
license=(MIT)
depends=(
  'glibc'
  'libgcc'
)
makedepends=(cargo)
source=("$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
b2sums=('53db2f5299480403629b5e81890fbede6ddc4dd2c245d44c3818f50ed77f153eab879a1cd8efb5d854de5a5fd358cd5b2b37b043fb8bdedde1e6471c0e77bcdc')

prepare() {
    cd "machfile-$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target host-tuple
}

build() {
    cd "machfile-$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo build --frozen --release
}

check() {
    cd "machfile-$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --workspace
}

package() {
    cd "machfile-$pkgname-v$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mach"
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
