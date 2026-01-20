# Maintainer: Sayan Pal <sayan12428 at gmail dot com>

pkgname=phub-cli
pkgver=0.1.1
pkgrel=3
pkgdesc="Terminal-based video browser inspired by ani-cli, streaming directly from pornhub.com"
arch=('x86_64')
url="https://github.com/curtosis-org/phub-cli"
license=('MIT')
depends=('bash' 'mpv' 'fzf' 'yt-dlp' 'python' 'python-beautifulsoup4')

source=("https://github.com/curtosis-org/phub-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/phub-cli-$pkgver"

    # Main binary
    install -Dm755 phub-cli "$pkgdir/usr/bin/phub-cli"

    # Install modules
    install -d "$pkgdir/usr/share/phub-cli"
    cp -r modules "$pkgdir/usr/share/phub-cli/"

    # Patch DIR path inside phub-cli to system location
    sed -i '0,/DIR=/{s|DIR=.*|DIR="/usr/share/phub-cli"|}' "$pkgdir/usr/bin/phub-cli"

    # Permissions
    chmod +x "$pkgdir/usr/share/phub-cli/modules/"*.sh
    chmod +x "$pkgdir/usr/share/phub-cli/modules/"*.py

    # License
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
