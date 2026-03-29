# Maintainer: Creptic <creptics@gmail.com>
pkgname=qbtctl
pkgver=1.5.1
pkgrel=1
pkgdesc="Minimal CLI for qBittorrent (built from source)"
arch=('x86_64')
url="https://github.com/creptic/qbtctl"
license=('GPL3')
depends=('curl' 'zlib' 'libsodium')       # runtime deps for dynamic binary
makedepends=('gcc' 'make' 'git')          # needed for building
source=("https://github.com/creptic/qbtctl/archive/refs/tags/1.5.1.tar.gz")
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
sha256sums=('d4ebfece544b7c47841b7efb7ae8f366cfe0a916b87ab741fc83b06979bbfbe3')
