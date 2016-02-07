# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-git
_pkgname=dasom
pkgver=1.2.1.d449cd3
pkgrel=1
pkgdesc="Dasom is a multilingual input method framework"
arch=('any')
url="https://github.com/dasom-im/${_pkgname}"
license=('GNU LGPL v3')
depends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'xorg-server-utils' 'glib2' 'libappindicator-gtk3')
makedepends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'intltool' 'gobject-introspection' 'glib2' 'libappindicator-gtk3' 'git' 'librsvg' 'noto-fonts-cjk')
optdepends=('dconf-editor: For Editing Dasom IM Config')
conflicts=("dasom")
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
