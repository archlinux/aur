# Maintainer: Jesus Franco <jesusfranco at gmail dot com>

_pkgname="ciano"
pkgname="${_pkgname}-git"
pkgver=0.1.9.11.g8c62934
pkgrel=1
pkgdesc="A simple multimedia file converter for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/robertsanseries/${pkgname}"
license=('GPL3')

depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple' 'gtksourceview3' 'libdbusmenu-gtk3' 'webkit2gtk' 'ffmpeg' 'imagemagick')
optdepends=('elementary-icon-theme')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja')
options=('!libtool')
conflicts=('ciano' 'ciano-bzr')
provides=('ciano')
source=("git+https://github.com/robertsanseries/ciano.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
        echo $(git describe --tags | sed s'/v\.//;s/-/./g')
}

build() {
	cd "${_pkgname}"
	arch-meson build
	ninja -C build
}

package() {
	cd "${_pkgname}"
	DESTDIR="${pkgdir}/" ninja -C build install
}

