# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-gtk-git
_pkgname=dasom-gtk
pkgver=1.2.1efa82a
pkgrel=1
pkgdesc="GTK+ IM modules for Dasom"
arch=('any')
url="https://github.com/dasom-im/${_pkgname}"
license=('GNU LGPL v3')
depends=('gtk2' 'gtk3' 'xorg-server-utils' 'glib2' 'dasom-git')
makedepends=('gtk2' 'gtk3' 'intltool' 'gobject-introspection' 'glib2' 'git' 'dasom-git')
optdepends=('dconf-editor: For Editing Dasom IM Config')
conflicts=("dasom-gtk")
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
