# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=everforest-gtk-theme-git
pkgver=r17.aba45df6
pkgrel=1
pkgdesc='Everforest colour palette for GTK'
arch=('any')
url="https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme"
license=('GPL3')
depends=()
makedepends=('git')
source=("$pkgname"::'git+https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -e 's/oomox-//' -i icons/*/index.theme
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir"/usr/share/{icons,themes}
    cp -r icons/Everforest-Dark "$pkgdir/usr/share/icons"
    cp -r themes/Everforest-Dark-B "$pkgdir/usr/share/themes/Everforest-Dark-Border"
    cp -r themes/Everforest-Dark-BL "$pkgdir/usr/share/themes/Everforest-Dark-Borderless"
}

# vim: set ts=4 sw=4 et :
