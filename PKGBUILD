# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-jeongeum-git
_pkgname=dasom-jeongeum
pkgver=268.b5a8524
pkgrel=1
pkgdesc="dasom-jeongeum is a Korean engine based on libhangul"
arch=('any')
url="https://github.com/dasom-im/${_pkgname}"
license=('GNU LGPL v3')
depends=('dasom-git' 'gtk2' 'gtk3' 'qt4' 'qt5-base' 'libhangul' 'xorg-server-utils' 'glib2')
makedepends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'libhangul' 'intltool' 'gobject-introspection' 'glib2' 'git' 'librsvg')
optdepends=('dconf-editor: For Editing Dasom IM Config')
conflicts=("dasom-jeongeum")
source=("${_pkgname}"::"git+https://github.com/dasom-im/${_pkgname}.git")
md5sums=('SKIP')
options=(!buildflags)
install=$pkgname.install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
