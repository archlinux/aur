# Maintainer: Noeljunior <liamgliam {at} gmail {dot} com>
# Contributor: Alexandre Moine <nobrakal {at} cthugha {dot} org>
# Contributor: < eti {at} eti {dot} tf >
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-solid-grey-git
_pkgname=arc-grey-theme
_pkgauthor=eti1337
pkgver=r727.ac2e88f
pkgrel=1
pkgdesc="A flat, grey theme without transparent elements for GTK 3, GTK 2 and Gnome-Shell. Latest commit from the master branch on Github."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('gtk-theme-arc-grey')
provides=('gtk-theme-arc-grey')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr --disable-transparency
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
