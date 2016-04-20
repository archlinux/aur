# Maintainer: Gui||aume <michaudg[at]gmail[dot]com>
# Contributor: zach <zach {at} zach-adams {dot} com>

pkgname=gtk-theme-arc-opaque-git
_pkgname=arc-theme
_pkgauthor=horst3180
pkgver=506.90f1c14
pkgrel=1
pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell. With --disable-transparency build option. Latest commit from Github."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/horst3180/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('gtk-theme-arc', 'gtk-theme-arc-git')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr --disable-transparency
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
