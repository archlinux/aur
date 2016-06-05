# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=libhwp-git
_pkgname=libhwp
pkgver=2016.05.15.1b14322
pkgrel=1
pkgdesc="library for handling hwp documents"
arch=('any')
url="https://github.com/cogniti/${_pkgname}"
license=('GNU GPL v2+')
depends=('intltool' 'gobject-introspection' 'glib2' 'git' 'libxml2' 'openssl' 'pango' 'poppler-glib' 'cairo' 'libgsf' 'gtk-doc')
makedepends=('intltool' 'gobject-introspection' 'glib2' 'git' 'libxml2' 'openssl' 'pango' 'poppler-glib' 'cairo' 'libgsf' 'gtk-doc')
conflicts=("libhwp")
source=("${_pkgname}"::"git+https://github.com/cogniti/${_pkgname}.git")
md5sums=('SKIP')
options=(!buildflags)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git tag | sort -V | tail -1).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr
	make
}
package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
}
