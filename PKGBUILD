# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-kvantum-git
_pkgname=Sweet-kvantum
pkgver=r4.35261d4
pkgrel=1
pkgdesc="Sweet Kvantum theme for Qt applications"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
)
depends=(
    'kvantum'
)
provides=('sweet-kvantum')
conflicts=('sweet-kvantum')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    local theme
    for theme in Sweet Sweet-transparent-toolbar; do
        install -Dm644 -t "$pkgdir/usr/share/Kvantum/$theme" "src/$theme.kvconfig" "src/$theme.svg"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
