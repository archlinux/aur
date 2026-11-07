# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgbase=gruvbox-theme-git
pkgname=('gruvbox-icon-theme-git' 'gruvbox-gtk-theme-git')
pkgver=r64.de4e8370
pkgrel=2
pkgdesc='A GTK theme based on the Gruvbox colour palette.'
arch=('any')
url='https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme'
license=('GPL-3.0-only')
depends=('gtk-engine-murrine')
makedepends=('git' 'sassc')
source=("$pkgbase"::'git+https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgbase"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

package_gruvbox-icon-theme-git() {
    cd "$srcdir/$pkgbase"
    sed -i icons/*/index.theme -e 's/oomox-//'
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r icons/Gruvbox-Dark "$pkgdir/usr/share/icons/"
    cp -r icons/Gruvbox-Light "$pkgdir/usr/share/icons/"
}

package_gruvbox-gtk-theme-git() {
    cd "$srcdir/$pkgbase/themes"
    ./build.sh
    mkdir -p "$pkgdir/usr/share/themes"
    ./install.sh --dest "$pkgdir/usr/share/themes" --theme all
}

# vim: set ts=4 sw=4 et :
