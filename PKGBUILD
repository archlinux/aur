# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xplayer
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple media player. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('clutter-gtk' 'clutter-gst' 'xplayer-plparser'
    'desktop-file-utils' 'iso-codes' 'yelp-xsl'
    'libpeas' 'gsettings-desktop-schemas'
    'python2-gobject' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection')
optdepends=('gst-libav: Extra media codec support')
provides=($_pkgname)
conflicts=('xplayer-git' $_pkgname)
url='https://github.com/linuxmint/xplayer'
install=xplayer.install

source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6dcb1abab3a6b57bac9fb5c42714116b')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i 's/PYTHON=python/PYTHON=python2/g' py-compile
    ./autogen.sh --with-gtk=3.0 --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/xplayer"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

