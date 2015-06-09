# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

_pkgname="frogr"
pkgname="${_pkgname}-git"
pkgver=0.10.3.g39cf974
pkgrel=1
pkgdesc="A flickr remote organizer for GNOME"
url="https://wiki.gnome.org/Apps/Frogr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'gtk3' 'hicolor-icon-theme' 'json-glib' 'libexif' 'libsoup')
makedepends=('intltool' 'git' 'gnome-common' 'yelp-tools')
optdepends=('gst-libav: To support common video formats like .3gp and .MP4')
install="${_pkgname}.install"
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://git.gnome.org/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}

build() {
    cd "${_pkgname}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
