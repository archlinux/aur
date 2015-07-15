# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-git
_pkgname=Arc-theme
pkgver=128.1377577
pkgrel=1
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/horst3180/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir" install
	rm -rf {.git,COPYING,README.md}
}
