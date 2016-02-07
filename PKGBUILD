# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-qt-git
_pkgname=dasom-qt
pkgver=1.2.4.f6060cc
pkgrel=1
pkgdesc="QT IM modules for Dasom"
arch=('any')
url="https://github.com/dasom-im/${_pkgname}"
license=('GNU LGPL v3')
depends=('qt4' 'qt5-base' 'xorg-server-utils' 'glib2' 'dasom-git')
makedepends=('qt4' 'qt5-base' 'gobject-introspection' 'glib2' 'git' 'dasom-git')
optdepends=('dconf-editor: For Editing Dasom IM Config')
conflicts=("dasom-qt")
source=("${_pkgname}"::"git+https://github.com/dasom-im/${_pkgname}.git")
md5sums=('SKIP')
options=(!buildflags)
install=$pkgname.install
groups=('dasom')

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
