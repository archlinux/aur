# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme-git
pkgver=4.0.r680.g812b197
pkgrel=1
pkgdesc="Icon theme based on Gruvbox color scheme"
arch=(any)
url=https://github.com/SylEleuth/gruvbox-plus-icon-pack
license=(GPL3)
depends=('gtk-update-icon-cache')
makedepends=('git' 'fd')
provides=(gruvbox-plus-icon-theme)
conflicts=()
options=(!strip !emptydirs)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname/Gruvbox-Plus-Dark"
    # remove files with whitespaces as it messes up gtk-update-icon-cache
    fd '.*\s[^/]*' -X rm {}
    # remove cache as it will be generated again
    rm icon-theme.cache
    install -d "$pkgdir/usr/share/icons"
    cp -r ./ "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
}

