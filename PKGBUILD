# Maintainer: Javillo fjaviergrodriguez@gmail.com

pkgname=brightge
pkgver=1.2.3
pkgrel=1
pkgdesc="Command-line tool for controlling backlight brightness"
arch=('x86_64')
url="https://github.com/Javillo10/brightge"
license=('MIT')

depends=('glibc' 'gcc-libs')
makedepends=('cargo')

install="$pkgname.install"

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Javillo10/brightge/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('35d43c922479a8cb1c6d1fd9cb1496b2b00b0dbe86aa1076e2bfc79bf222f2c6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/brightge \
        "$pkgdir/usr/bin/brightge"

    install -Dm644 brightge.1 \
        "$pkgdir/usr/share/man/man1/brightge.1"

    install -Dm644 99-brightge.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-brightge.rules"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
