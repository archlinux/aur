# Maintainer: Emersion <contact at emersion dot fr>
# https://github.com/emersion/aur-markmywords
#
# Author: voldyman <voldyman666 at gmail dot com>

_gitname="MarkMyWords"
_pkgname="markmywords"
pkgname="${_pkgname}-git"
pkgver=d6f19f4
pkgrel=1
pkgdesc="A minimal markdown editor. It is currently under heavy development."
url="https://github.com/voldyman/MarkMyWords"
arch=('i686' 'x86_64')
license=('None')
depends=('gtksourceview3' 'glib2' 'gtk3' 'webkit2gtk')
makedepends=('vala' 'gobject-introspection' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install='gschemas.install'
source=("git://github.com/voldyman/MarkMyWords.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}

build() {
	cd "${srcdir}/${_gitname}"
	sed -i "s|webkit2gtk-3.0|webkit2gtk-4.0|g" CMakeLists.txt
    
	# See https://github.com/voldyman/MarkMyWords#how-to-build
	mkdir build && cd build
	cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make DESTDIR="${pkgdir}" install
}
