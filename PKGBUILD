# Maintainer: Creptic <creptics@gmail.com>
pkgname=qbtctl
pkgver=1.5.0
pkgrel=1
pkgdesc="Minimal, ultra-fast command-line interface for controlling a torrent in qBittorrent via its Web API."
arch=('x86_64')
url="https://github.com/creptic/qbtctl"
license=('GPL3')
depends=('curl' 'zlib' 'libsodium')       # runtime deps for dynamic binary
makedepends=('gcc' 'make' 'git')          # needed for building
source=("https://github.com/creptic/qbtctl/archive/refs/tags/1.5.0.tar.gz")
sha256sums=('cb738f3def48d4f4220447288b21ca2ec21ef00e15da08a8aeedf02c0f3cd1d5')
options=('!debug')
build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Clean previous builds
    make clean

    # Build dynamic qbtctl
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install dynamic binary
    install -Dm755 qbtctl "$pkgdir/usr/bin/qbtctl"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 INSTALL.txt "$pkgdir/usr/share/doc/$pkgname/INSTALL.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
