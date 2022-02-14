# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xplayer
pkgver=2.4.2
pkgrel=2
pkgdesc="Simple media player. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=(
    'clutter-gtk' 'clutter-gst' 'xplayer-plparser'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas' 'dbus-glib'
    'python-gobject' 'gst-plugins-base' 'gst-plugins-good'
    'xapps'
)
makedepends=(
    'gnome-common' 'gtk-doc' 'gobject-introspection' 'vala'
    'python-pylint' 'lirc' 'zeitgeist' 'grilo')
optdepends=(
    'gst-libav: Extra media codec support'
    'lirc: Infrared remote control plugin'
    'zeitgeist: Zeitgeist interface plugin'
    'grilo: Grilo plugins'
)
provides=($pkgname)
conflicts=('xplayer-git')
url='https://github.com/linuxmint/xplayer'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('00bfa48048b789cc0e79b3b0e38df117')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./autogen.sh ax_is_release="yes" \
        --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
