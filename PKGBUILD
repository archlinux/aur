# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-jeongeum-git
_pkgname=dasom-jeongeum
pkgver=1.2.1.c911a64
pkgrel=1
pkgdesc="Korean engine module based on libhangul for Dasom"
arch=('any')
url="https://github.com/dasom-im/${_pkgname}"
license=('GNU LGPL v3')
depends=('dasom-git' 'gtk2' 'gtk3' 'libhangul' 'xorg-server-utils' 'glib2')
makedepends=('dasom-git' 'gtk2' 'gtk3' 'libhangul' 'intltool' 'gobject-introspection' 'glib2' 'git' 'librsvg')
optdepends=('dconf-editor: For Editing Dasom IM Config')
conflicts=("dasom-jeongeum")
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
