# Maintainer: Simon Barth <sb at b1t dot at>

pkgname=machfile-cli
pkgver=0.2.3
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
b2sums=(
  6b0ee2896f929d1611cbbfb0220a19d48616788d60a852cc6af11b63b89af02db4b018cb043d853ef444f52424646e1a24dbb37da631dfda2258e1967ea9ad1c
)

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
