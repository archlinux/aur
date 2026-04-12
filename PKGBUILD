# Maintainer: Antoine Bertin <antoine.bertin@archlinux.org>

pkgname=gruvbox-plus-icon-theme-git
pkgver=6.3.0.r2120.gd176a49
pkgrel=1
pkgdesc="Icon theme based on Gruvbox color scheme"
arch=(any)
url=https://github.com/SylEleuth/gruvbox-plus-icon-pack
license=(GPL3)
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=(gruvbox-plus-icon-theme)
conflicts=(gruvbox-plus-icon-theme)
options=(!strip !emptydirs)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    install -d "$pkgdir/usr/share/icons"
    # remove caches as they will be generated again
    rm Gruvbox-Plus-Dark/icon-theme.cache Gruvbox-Plus-Light/icon-theme.cache
    cp -r ./Gruvbox-Plus-Dark "$pkgdir/usr/share/icons/Gruvbox-Plus-Dark"
    cp -r ./Gruvbox-Plus-Light "$pkgdir/usr/share/icons/Gruvbox-Plus-Light"
}
