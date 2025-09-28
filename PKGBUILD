# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=stasis
pkgver=0.1.3
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('MIT')
depends=('systemd' 'libinput' 'wayland')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9022843f48daa2ddd9f9239088247b204ed1efad31b722d954b9b72e0cff699')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked --features "wlroots_virtual_keyboard"
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

