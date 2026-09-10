# Maintainer: Nguyen Ky <nhktmdzhg at google mail dot com>
pkgname=yuzufox-git
_pkgname=YuzuFox
pkgver=155.0.r0.gc702c73
pkgrel=1
pkgdesc='Hardened, zero-bloat Firefox for daily use.'
depends=('firefox' 'xdg-desktop-portal-impl')
arch=('any')
license=('MIT')
backup=('etc/firefox/policies/policies.json')
url="https://github.com/KabosuNeko/YuzuFox"
conflicts=(firefox-settings)
replaces=(firefox-settings)
provides=(firefox-settings)
source=("git+https://github.com/KabosuNeko/YuzuFox.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/YuzuFox"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm644 "$srcdir/$_pkgname/user.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/user.js"
    install -Dm644 "$srcdir/$_pkgname/yuzu.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/yuzu.js"
    install -Dm644 "$srcdir/$_pkgname/policies.json" "$pkgdir/etc/firefox/policies/policies.json"
}
