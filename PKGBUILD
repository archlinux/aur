# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor : Ivo Nunes <ivoavnunes at gmail dot com>
_pkgname="birdie"
pkgname="${_pkgname}-git"
pkgver=1.1+git.99.g89a63d3
pkgrel=1
pkgdesc="Twitter client for Linux"
arch=('i686' 'x86_64')
url="http://birdieapp.github.io"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple' 'gtksourceview3' 'libdbusmenu-gtk3' 'webkit2gtk') 
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja')
options=('!libtool')
conflicts=('birdie' 'birdie-bzr')
provides=('birdie')
source=("${_pkgname}::git+https://github.com/birdieapp/birdie.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
        echo $(git describe --tags | sed s'/v\.//;s/-/./g')
}

build() {
	cd "${_pkgname}"
	arch-meson build \
    -Db_pie=false
	ninja -C build
}

package() {
	cd "${_pkgname}"
	DESTDIR="${pkgdir}/" ninja -C build install
}
