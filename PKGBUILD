# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xplayer-git
_pkgbasename=xplayer
pkgver=2.2.3.r0.gb3f42a4
pkgrel=1
pkgdesc="Simple media player. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser-git'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas' 'dbus-glib'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good'
    'xapps')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection' 'vala')
optdepends=('gst-libav: Extra media codec support')
provides=($pkgname $_pkgbasename)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/xplayer'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}

    ./autogen.sh ax_is_release="yes" \
        --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${_pkgbasename}"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

