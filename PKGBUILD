pkgname=jay-bin
pkgver=7.4.3
pkgrel=1
pkgdesc="A lightweight, semantic AUR helper wrapper for Arch Linux"
arch=('any')
url="https://github.com/xmlzitos154/jay"
license=('MIT')
depends=('bash')
optdepends=(
    'flatpak: hybrid AUR/Flatpak mode'
    'reflector: mirror optimization support'
    'expac: system statistics'
)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd jay
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd jay
    install -Dm755 main.sh "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
    install -Dm644 modules/base.sh "$pkgdir/usr/share/jay/base.sh"
    install -Dm644 modules/logging.sh "$pkgdir/usr/share/jay/logging.sh"
    install -Dm644 modules/cache.sh "$pkgdir/usr/share/jay/cache.sh"
    install -Dm644 modules/etc.sh "$pkgdir/usr/share/jay/etc.sh"
    install -Dm644 modules/flatpak.sh "$pkgdir/usr/share/jay/flatpak.sh"
    install -Dm644 languages/pt.sh "$pkgdir/usr/share/jay/pt.sh"
    install -Dm644 languages/en.sh "$pkgdir/usr/share/jay/en.sh"
}
