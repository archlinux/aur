# Maintainer: Leonid Selivanov <bravebug at gmail dot com>
#
pkgname=plano-theme-git
pkgver=r309.1eacc2b
pkgrel=1
pkgdesc="Flat GTK, xfwm4, Openbox theme"
arch=('any')
url="https://github.com/lassekongo83/plano-theme"
license=(GPL3)
depends=(gtk-engine-murrine gtk-engines)
makedepends=(ninja meson sassc)
conflicts=(plano-theme)
provides=(plano-theme)
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
