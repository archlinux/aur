# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-git
pkgver=1.0.4
pkgrel=1
pkgdesc="Randize case of your input text. Totally useless, but written in Rust."
url="https://gitlab.com/ykkzde/random-case"
license=('GPL3')
provides=('random-case')
conflicts=('random-case-bin')
depends=(
    gcc-libs
)
makedepends=(
    rust
    cargo
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/v$pkgver/random-case-v$pkgver.tar.gz")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('484a5d8b0e9132bec8259081e4d93b82ecf63fe8e4a8899ca2c06a39517e295646f7732954b1f711387712e6d0b46b851b2785ca04d0a1d0501b39a106a86f76')

arch=('x86_64')

build() {
    cd random-case-v$pkgver
    cargo build --release
}

package() {
    cd "$srcdir/random-case-v$pkgver"

    # Install Binary
    install -Dm755 "./target/release/random-case" "$pkgdir/usr/bin/random-case"
}
