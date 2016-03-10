# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer-git
pkgver=1.0.2.r3.gca10bcb
pkgrel=1
pkgdesc="Simple media player. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser-git'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=($_pkgname)
conflicts=('xplayer' $_pkgname)
url='https://github.com/linuxmint/xplayer'
install=xplayer.install

source=('xplayer-git::git+https://github.com/linuxmint/xplayer.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    sed -i 's/PYTHON=python/PYTHON=python2/g' py-compile
    ./autogen.sh --with-gtk=3.0 --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/xplayer"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

