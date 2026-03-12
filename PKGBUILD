# Maintainer: Libertaria <dev@libertaria.dev>
# Contributor: Your Name <your@email>
pkgname=lightpanda
pkgver=nightly
pkgrel=1
pkgdesc="Headless browser designed for AI and automation - 11x faster than Chrome, 9x less memory"
arch=('x86_64' 'aarch64')
url="https://lightpanda.io"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=('lightpanda')

_x86_64_url="https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-x86_64-unknown-linux-gnu.tar.gz"
_aarch64_url="https://github.com/lightpanda-io/browser/releases/download/nightly/lightpanda-aarch64-unknown-linux-gnu.tar.gz"

source_x86_64=("$_x86_64_url")
source_aarch64=("$_aarch64_url")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    # Extract based on architecture
    if [[ "$CARCH" == "x86_64" ]]; then
        tar -xzf "lightpanda-x86_64-unknown-linux-gnu.tar.gz" -C "$pkgdir/usr/bin/"
    elif [[ "$CARCH" == "aarch64" ]]; then
        tar -xzf "lightpanda-aarch64-unknown-linux-gnu.tar.gz" -C "$pkgdir/usr/bin/"
    fi
    
    # Make executable
    chmod +x "$pkgdir/usr/bin/lightpanda"
    
    # Install man page
    install -Dm644 "$srcdir/lightpanda-x86_64-unknown-linux-gnu/lightpanda.1" "$pkgdir/usr/share/man/man1/lightpanda.1" 2>/dev/null || true
}
