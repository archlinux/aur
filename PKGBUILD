# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xplayer
pkgver=2.4.0
pkgrel=1
pkgdesc="Simple media player. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=(
    'clutter-gtk' 'clutter-gst' 'xplayer-plparser'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas' 'dbus-glib'
    'python-gobject' 'gst-plugins-base' 'gst-plugins-good'
    'xapps')
makedepends=(
    'gnome-common' 'gtk-doc' 'gobject-introspection' 'vala' 'python-xdg'
    'python-pylint' 'lirc' 'zeitgeist' 'grilo')
optdepends=(
    'gst-libav: Extra media codec support'
    'python2-xdg: Subtitle downloader plugin'
    'lirc: Infrared remote control plugin'
    'zeitgeist: Zeitgeist interface plugin'
    'grilo: Grilo plugins'
)
provides=($pkgname)
conflicts=('xplayer-git')
url='https://github.com/linuxmint/xplayer'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6f18fa65a54d4e9c3b7fedad2344aaad')


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
