# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=kanagawa-gtk-theme-git
pkgver=r6.5ec6821f
pkgrel=1
pkgdesc='GTK theme with the Kanagawa colour palette'
arch=('any')
url="https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme"
license=('GPL3')
depends=()
makedepends=()
source=("$pkgname"::'git+https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme.git')
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
    cp -r icons/Kanagawa "$pkgdir/usr/share/icons"
    cp -r themes/Kanagawa-B "$pkgdir/usr/share/themes/Kanagawa-Border"
    cp -r themes/Kanagawa-BL "$pkgdir/usr/share/themes/Kanagawa-Borderless"
}

# vim: set ts=4 sw=4 et :
