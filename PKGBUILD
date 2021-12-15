# Maintainer: Leonid Selivanov <bravebug at gmail dot com>
#
pkgname=stajl-theme-git
pkgver=r100.2660577
pkgrel=1
pkgdesc="A theme for GNOME based on Adwaita"
arch=('any')
url="https://github.com/lassekongo83/stajl-theme"
license=(GPL3)
depends=(gtk-engine-murrine gtk-engines)
makedepends=(ninja meson sassc)
conflicts=(stajl-theme)
provides=(stajl-theme)
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver () {
   	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    meson build
}

package(){
    cd $pkgname
    DESTDIR="$pkgdir" ninja -C build install
}
