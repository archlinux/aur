# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: uastasi <uastasi at archlinux dot us>
#
_pkgname="frogr"
pkgname="${_pkgname}-git"
pkgver=1.5.2.g9df2571
pkgrel=1
pkgdesc="A flickr remote organizer for GNOME"
url="https://wiki.gnome.org/Apps/Frogr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'gtk3' 'hicolor-icon-theme' \
         'json-glib' 'libexif' 'libsoup')
makedepends=('intltool' 'git' 'gnome-common' 'meson' 'yelp-tools')
optdepends=('gst-libav: To support common video formats like .3gp and .MP4')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/frogr.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}

build() {
    cd "${_pkgname}"
    mkdir -p build && cd build
    arch-meson ..
    ninja
}

package() {
    cd "${_pkgname}/build"
    install -Dm 644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    DESTDIR="${pkgdir}" ninja install
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
