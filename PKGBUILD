# Maintainer: Vic Luo  <vicluo96@gmail.com>
pkgname=xmradio-git
pkgver=1.0
pkgrel=1
pkgdesc="xmradio is a tiny Internet Xia Mi Radio client for Linux, which supports many radio style, skin builtin and many other features."
arch=('any')
url="https://github.com/timxx/xmradio"
license=('GPL3')
depends=('dbus'
                'vlc')
makedepends=('cmake'
                'gcc'
                'gettext'
                'intltool'
                'pkg-config'
                'zlib'
                'sqlite'
                'libnotify'
                'glib2'
                'curl'
                'libxml2'
                'gtk3'
                'dbus-glib'
                'libdbusmenu-glib'
                'gstreamer'
                'libpeas-git')
source=("https://github.com/timxx/xmradio/archive/master.zip"
        "$pkgname-$pkgver.patch")

md5sums=('SKIP'
        '29fb1bd33a1c91b1d49fa28a5166fa4c')

        prepare() {
                cd "xmradio-master"
                patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
        }

build() {
	cd "xmradio-master"
    mkdir build
    cd build
    echo "$pkgdir"
    cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
	cd "xmradio-master/build"
	make DESTDIR="$pkgdir/" install
}
