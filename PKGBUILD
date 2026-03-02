pkgname=susshi
pkgver=0.8.1
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager'
url='https://github.com/yatoub/sushi'
license=('MIT')
makedepends=('cargo')
depends=('openssh')
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
source=("https://github.com/yatoub/sushi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(413ba7bb878eb00263539964fc9a546eb486b964f5a9c25344bcef7137215b80c65c47553370da591d6d536d74e5092c1b84d0f0db07e0650b4dd7fade76f7e2)

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
