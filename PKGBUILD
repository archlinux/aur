# Maintainer: Noeljunior <liamgliam {at} gmail {dot} com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-solid-git
_pkgname=arc-theme
_pkgauthor=horst3180
pkgver=663.8290cb8
pkgrel=1
pkgdesc="A flat theme without transparent elements for GTK 3, GTK 2 and Gnome-Shell. Latest commit from the master branch on Github."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/horst3180/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('arc-gtk-theme')
provides=('arc-gtk-theme')

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
