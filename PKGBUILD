# Maintainer: Alexandros McCray <alexandros at amccray dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=runa
pkgver=0.11.0
pkgrel=1
pkgdesc="A fast and lightweight terminal file manager written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('997a4e8672f0b931bd8f191bd32d4476a873f62e781dbdac4a29b1385fa173d0')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
