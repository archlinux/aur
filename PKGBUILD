# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-git
_pkgname=dasom
pkgver=228.4cb1021
pkgrel=1
pkgdesc="Dasom is an input method framework"
arch=('any')
url="https://github.com/cogniti/${_pkgname}"
license=('GNU LGPL v3')
depends=('gtk2' 'gtk3' 'qt4' 'qt5-3d' 'qt5-base' 'qt5-canvas3d' 'qt5-connectivity' 'qt5-declarative' 'qt5-enginio' 'qt5-graphicaleffects' 'qt5-imageformats' 'qt5-location' 'qt5-multimedia' 'qt5-quick1' 'qt5-quickcontrols' 'qt5-script' 'qt5-sensors' 'qt5-serialport' 'qt5-svg' 'qt5-tools' 'qt5-translations' 'qt5-wayland' 'qt5-webchannel' 'qt5-webengine' 'qt5-webkit' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns'
 'libhangul')
makedepends=('intltool' 'gobject-introspection' 'glib2' 'libappindicator3' 'git')
conflicts=("dasom")
source=("${_pkgname}"::"git+https://github.com/cogniti/${_pkgname}.git")
md5sums=('SKIP')
options=(!buildflags)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	make
}
package() {
	cd "${srcdir}/${_pkgname}"
	echo "Packaging.. : [Desktop Shortcut] | Icon | Other Files | Done"
	make DESTDIR="${pkgdir}/" install
}

post_install() {
	glib-compile-schemas /usr/share/glib-2.0/schemas
	ldconfig
}

post_upgrade() {
	post_install $1
}
