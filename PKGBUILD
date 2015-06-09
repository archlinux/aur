# Maintainer: sekret
_pkgname=marble
pkgname=$_pkgname-minimal
pkgver=1.9.1
_kdever=4.14.3
pkgrel=1
pkgdesc="a virtual globe and world atlas (minimal version)"
arch=('i686' 'x86_64')
url="http://marble.kde.org"
license=('LGPL2.1' 'GPL')
depends=('qtwebkit')
makedepends=('cmake')
provides=('kdeedu-marble')
conflicts=('kdeedu-marble')
install=$pkgname.install
source=(http://download.kde.org/stable/$_kdever/src/$_pkgname-$_kdever.tar.xz)
md5sums=('c102d058423e0cee1ee964eebe6ac6c2')

build() {
 cd "$_pkgname-$_kdever"
 cmake -DBUILD_HARMATTAN_ZOOMINTERCEPTO=OFF \
       -DBUILD_INHIBIT_SCREENSAVER_PLUG=OFF \
       -DBUILD_MARBLE_APPS=ON \
       -DBUILD_MARBLE_EXAMPLES=OFF \
       -DBUILD_MARBLE_TESTS=OFF \
       -DBUILD_MARBLE_TOOLS=OFF \
       -DBUILD_TESTING=OFF \
       -DCMAKE_BUILD_TYPE=Release \
       -DQTONLY=TRUE \
       -DWITH_DESIGNER_PLUGIN=OFF \
       -DWITH_Phonon=OFF \
       -DWITH_QextSerialPort=OFF \
       -DWITH_QtLocation=OFF \
       -DWITH_libgps=OFF \
       -DWITH_liblocation=OFF\
       -DWITH_libshp=OFF \
       -DWITH_libwlocate=OFF \
       -DWITH_quazip=OFF \
       -DBUILD_WITH_DBUS=OFF \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DMOBILE=OFF
 make
}

package() {
 cd "$_pkgname-$_kdever"
 make DESTDIR="$pkgdir/" install
}
