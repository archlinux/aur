# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgbase=everforest-gtk-theme-git
pkgname=('everforest-icon-theme-git' 'everforest-gtk-theme-git')
pkgver=r54.462458b1
pkgrel=1
pkgdesc='Everforest colour palette for GTK'
arch=('any')
url='https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'sassc')
source=("$pkgbase"::'git+https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgbase"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

package_everforest-icon-theme-git() {
    cd "$srcdir/$pkgbase"
    sed -i icons/*/index.theme -e 's/oomox-//'
    sed -i icons/Everforest-Light/index.theme -e 's/[Ee]verforest_[Ll]ight/Everforest-Light/g'
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r icons/Everforest-Dark "$pkgdir/usr/share/icons/"
    cp -r icons/Everforest-Light "$pkgdir/usr/share/icons/"
}

package_everforest-gtk-theme-git() {
    cd "$srcdir/$pkgbase/themes"
    ./build.sh
    mkdir -p "$pkgdir/usr/share/themes"
    ./install.sh --dest "$pkgdir/usr/share/themes" --theme all
}

# vim: set ts=4 sw=4 et :
