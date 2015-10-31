# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor : Ivo Nunes <ivoavnunes at gmail dot com>
_pkgname="birdie"
pkgname="${_pkgname}-git"
pkgver=1.1+git.21.gf235c55
pkgrel=1
pkgdesc="Twitter client for Linux"
arch=('i686' 'x86_64')
url="http://birdieapp.github.io"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'python2-requests' 'python2-requests-oauthlib' 'pygtksourceview2' 'python2-pillow' 'gtksourceview3' 'webkitgtk' 'python2-socksipy-branch')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection')
options=('!libtool')
conflicts=('birdie' 'birdie-bzr')
provides=('birdie')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/birdieapp/birdie.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
        echo $(git describe --tags | sed s'/v\.//;s/-/./g')
}

build() {
	cd "${_pkgname}"
	export PYTHON=`which python2`
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}/" install
	sed -i 's|/usr/bin/env python|/usr/bin/python2|' ${pkgdir}/usr/bin/birdie
}
