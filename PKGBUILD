# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=rhythmbox
pkgname=$_pkgname-git
pkgver=3.2.3.g9a024fa
pkgrel=1
pkgdesc="An iTunes-like music player/libary"
arch=(i686 x86_64)
license=(GPL2)
url=http://www.rhythmbox.org
depends=(desktop-file-utils gst-plugins-good gvfs-afc json-glib libdmapsharing
         libgnome-media-profiles libgpod libmtp libnotify libpeas libsecret libwebkit3 lirc-utils
         media-player-info totem-plparser)
makedepends=(brasero git gnome-common gnome-doc-utils gobject-introspection
             gtk-doc intltool python-gobject yelp-tools)
optdepends=('brasero: CD burning'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!emptydirs !libtool !strip)
install=$_pkgname.install
source=($pkgname::git://git.gnome.org/$_pkgname)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^v//;s/-/./g'
}

build() {
    cd $pkgname/
    export CFLAGS+=" -g -O1"
    export CXXFLAGS+=" -g -O1"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/rhythmbox \
        --localstatedir=/var \
        --disable-static \
        --enable-daap \
        --enable-python \
        --enable-musicbrainz \
        --with-mdns=avahi \
        --disable-scrollkeeper
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
