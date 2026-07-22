# Maintainer: Simon Barth <sb at b1t dot at>

pkgname=machfile-cli
pkgver=0.2.2
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
b2sums=(6e261df6acef6d8ed1a7c05eff293585f68477211e06ca4ee4d56d40f5a5045d1d25f1b7f50f3a5ea9c6ad133540cfff6ab2bdcd67293d219666383defb303fb)

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
