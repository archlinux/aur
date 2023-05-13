# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: uastasi <uastasi at archlinux dot us>
#
pkgname="frogr"
pkgver="1.7"
pkgrel="1"
pkgdesc="A flickr remote organizer for GNOME"
url="https://wiki.gnome.org/Apps/Frogr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'libexif' 'hicolor-icon-theme' 'json-glib' \
		 'desktop-file-utils' 'libsoup' 'gstreamer'
)
makedepends=('gnome-common' 'intltool' 'meson' 'yelp-tools')
optdepends=('gst-libav: To support common video formats like .3gp and .MP4 ')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.xz::http://download.gnome.org/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7507ce92001c6f1faa4e7c57513d9fa14da90051e6c26a14f34aaa9801625df9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build && cd build
	arch-meson ..
    ninja
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	install -m 644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	DESTDIR="${pkgdir}" ninja install
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
