pkgname=ark-cli
pkgver=0.1.0_alpha.15
pkgrel=1
pkgdesc="Plain-text terminal organiser for notes, todos, and events"
arch=('any')
url="https://github.com/benjaminingreens/ark"
license=('AGPL3')
depends=('perl')

source=("ark-v${pkgver//_/-}.tar.gz::https://github.com/benjaminingreens/ark/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/ark-${pkgver//_/-}"

    install -Dm755 bin/ark "$pkgdir/usr/bin/ark-cli"

    mkdir -p "$pkgdir/usr/lib/ark"
    cp -R lib/ark/. "$pkgdir/usr/lib/ark/"

    find "$pkgdir/usr/lib/ark" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/ark" -type f -exec chmod 644 {} \;

    if [ -d "$pkgdir/usr/lib/ark/commands" ]; then
        find "$pkgdir/usr/lib/ark/commands" -type f -exec chmod 755 {} \;
    fi

    install -Dm644 README.md "$pkgdir/usr/share/doc/ark-cli/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ark-cli/LICENSE"
}
