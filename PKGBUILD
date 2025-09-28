# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=stasis
pkgver=0.1.46
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('MIT')
depends=('systemd' 'libinput' 'wayland')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9c72b41431b8f7a41d3a32786d55e19d1760412664841c222d09017287ff47f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/stasis" "$pkgdir/usr/bin/stasis"

    # Install man page
    install -Dm644 "man/stasis.5" "$pkgdir/usr/share/man/man5/stasis.5"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example configuration
    install -Dm644 "examples/stasis.rune" "$pkgdir/usr/share/doc/$pkgname/stasis.rune"
}
