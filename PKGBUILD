# Maintainer: Vic Luo  <vicluo96@gmail.com>
# Maintainer: wenLiangcan <boxeed@gmail.com>
pkgname=xmradio-git
pkgver=0.5.2.3.gbf1e4ce
pkgrel=1
epoch=1
pkgdesc="xmradio is a tiny Internet Xia Mi Radio client for Linux, which supports many radio style, skin builtin and many other features."
arch=('i686' 'x86_64')
url="https://github.com/timxx/xmradio"
license=('GPL3')
depends=('dbus' 'vlc' 'gobject-introspection-runtime' 'curl' 'libxml2' 'gtk3' 'glib2' 'zlib' 'sqlite' 'libnotify' 'dbus-glib' 'libdbusmenu-glib' 'gstreamer' 'libpeas')
makedepends=('cmake'
             'gobject-introspection'
             'gcc'
             'gettext'
             'intltool'
             'pkg-config')
source=("git+https://github.com/timxx/xmradio.git")
install="${pkgname}.install"

md5sums=('SKIP')

pkgver() {
    cd "xmradio"
    git describe --tags --long | sed 's/-/./g'
}

build() {
    cd "xmradio"
    mkdir -p build
    cd build
    echo "$pkgdir"
    cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
    cd "xmradio/build"
    make DESTDIR="$pkgdir/" install
    if [[ 'x86_64' = "${CARCH}" ]]; then
        mv "${pkgdir}/usr/"{'lib64','lib'}
    fi
}

