pkgname=ark-cli
pkgver=0.1.0_alpha.5
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

    install -Dm755 ark "$pkgdir/usr/bin/ark-cli"

    install -Dm644 other/arkfuncs.pl \
        "$pkgdir/usr/lib/ark/other/arkfuncs.pl"

    install -d "$pkgdir/usr/lib/ark/commands"

    for cmd in commands/*; do
        [ -f "$cmd" ] || continue
        install -m755 "$cmd" "$pkgdir/usr/lib/ark/commands/$(basename "$cmd")"
    done

    install -Dm644 README.md "$pkgdir/usr/share/doc/ark-cli/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ark-cli/LICENSE"
}
