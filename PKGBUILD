# Maintainer: byeoriy <aiprily {at} icloud {dot} com>

pkgname=arc-greyed-theme-git
_pkgname=arc-greyed-theme
_pkgauthor=byeoriy
pkgver=0.1.0
pkgrel=2
pkgdesc="A flat, grey theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell. Latest commit from the master branch on Github."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git' 'autoconf' 'automake' 'pkg-config')
source=(${_pkgname}::"git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('arc-greyed-theme-git')
provides=('arc-greyed-theme-git')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
