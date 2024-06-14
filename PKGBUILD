# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xplayer
pkgver=2.4.4
pkgrel=1
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
    'python-pylint' 'lirc' 'zeitgeist' 'grilo'
    'glib2-devel'
)
optdepends=(
    'gst-libav: Extra media codec support'
    'lirc: Infrared remote control plugin'
    'zeitgeist: Zeitgeist interface plugin'
    'grilo: Grilo plugins'
    'yelp: View help and documentation from the app'
)
provides=($pkgname)
conflicts=('xplayer-git')
url='https://github.com/linuxmint/xplayer'

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz" '0001-type-cast-compiler-errors.patch')
md5sums=('535e2fac8ba729d218d00ec31a7ef80d' '920687067445959857f14e000bab2b14')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}

    patch --forward --strip=1 --input=../0001-type-cast-compiler-errors.patch
}

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
