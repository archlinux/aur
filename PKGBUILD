# Maintainer: willbasky
# Contributor: Denys Popov <denys@denyspopov.biz>
# Contributor: Dennis Gawrisch
#
# Native extensions packaging for libxkbcommon >= 1.13 (xkeyboard-config >= 2.45):
# the layout files are installed into the XKB *extensions directory*
# /usr/share/xkeyboard-config.d/rukbi/, which xkbcommon and libxkbregistry
# (kwin_wayland, KDE System Settings) scan automatically.
#
# No patching of xkeyboard-config files:
#   - symbols/  -> compiled by xkbcommon via include paths (keymap compilation)
#   - rules/evdev.xml -> layout registry read by libxkbregistry (GUI discovery)
#
# Updates of the xkeyboard-config package do not touch these files, and
# nothing is reverted on package upgrade/removal.

pkgname=rukbi
pkgdesc="Alternative keyboard layouts with miscellaneous useful typographic characters"
pkgver=5.0
pkgrel=1
url="https://ilyabirman.ru/typography-layout/"
arch=("any")
license=("MIT")
depends=("libxkbcommon>=1.13" "xkeyboard-config")
makedepends=("git")
install=rukbi.install
source=(
  "git+https://github.com/willbasky/rukbi.git#tag=v5.0"
  "evdev-rukbi.xml"
)
sha256sums=(
  'SKIP'
  '1e20d3a7df971ab9d1a10cb8b44a5cee755cd0c02199498934767574a9550756'
)

package() {
    cd "$srcdir/rukbi"
    local xkbdir="$pkgdir/usr/share/xkeyboard-config.d/rukbi"

    install -Dm644 symbols/eng "$xkbdir/symbols/eng"
    install -Dm644 symbols/deu "$xkbdir/symbols/deu"
    install -Dm644 symbols/rus "$xkbdir/symbols/rus"
    install -Dm644 symbols/ukr "$xkbdir/symbols/ukr"
    install -Dm644 "$srcdir/evdev-rukbi.xml" "$xkbdir/rules/evdev.xml"

    install -Dm644 "$srcdir/rukbi/README.md" "$pkgdir/usr/share/doc/rukbi/README.md"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/rukbi/LICENSE"
}