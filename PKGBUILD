# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-git
pkgver=1.0.5
pkgrel=1
pkgdesc="Randomize case of your input text."
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
sha512sums=('3d70f2e632757a37c022d0a058f97da53f87b543ac3b32dfe02f115e6fcb63c2cb66fdfc31d3bcd5b0208dea83bd5b356483b69c77ce541464e2ca71d523b85a')

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
