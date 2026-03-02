pkgname=susshi
pkgver=0.9.0
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager'
url='https://github.com/yatoub/susshi'
license=('MIT')
makedepends=('cargo')
depends=('openssh')
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(24903fcb4f329e232124c687d63c5ef144415b961a0e94a804f7ad75dde64d8769326879064d9e40d62bff6a6204f0468181872f66b2c75976a2375cb9850e21)

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed 's/host: //;t;d')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
