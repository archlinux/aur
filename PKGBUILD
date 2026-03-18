# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=rofi-webapps-git
pkgver=r1.0
pkgrel=1
pkgdesc="Rofi-based interface for managing web applications with icon search and CRUD operations"
arch=('any')
url="https://github.com/winiciuscota/rofi-webapps"
license=('MIT')
depends=('python' 'rofi' 'libnotify')
makedepends=('git')
provides=('rofi-webapps')
conflicts=('rofi-webapps')
source=("rofi-webapps::git+https://github.com/winiciuscota/rofi-webapps.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/rofi-webapps"
    ( git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | grep . ) \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    : # pure python — nothing to compile
}

package() {
    cd "$srcdir/rofi-webapps"

    install -Dm755 rofi-webapps     "$pkgdir/usr/bin/rofi-webapps"
    install -Dm755 webapps-backend  "$pkgdir/usr/lib/rofi-webapps/webapps-backend"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
