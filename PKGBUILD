# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=snug
pkgver=0.2.1
pkgrel=1
pkgdesc="Wrapping your Wayland sessions for a cozy look"
arch=('x86_64')
url="https://github.com/saltnpepper97/snug"
license=('MIT')
depends=('wayland' 'libinput')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('380e4b53c3eb15ebce60e7d29f3218743b300ae2d0e8740ac8ab95154c6b6965')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main binary
    install -Dm755 "target/release/snug" "$pkgdir/usr/bin/snug"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    if [[ -f examples/snug.rune ]]; then
        install -Dm644 "examples/snug.rune" "$pkgdir/usr/share/doc/$pkgname/snug.rune"
    fi

    if [[ -f launch-snug-with-waybar.sh ]]; then
        install -Dm755 "launch-snug-with-waybar.sh" "$pkgdir/usr/share/$pkgname/launch-snug-with-waybar.sh"
    fi
}
