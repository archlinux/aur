# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=marble
pkgver=1.9.1
_kdever=4.14.3
pkgrel=1
pkgdesc="a virtual globe and world atlas"
arch=('i686' 'x86_64')
url="https://marble.kde.org"
license=('LGPL2.1' 'GPL')
depends=('qtwebkit' 'phonon-qt4')
makedepends=('cmake' 'quazip' 'shapelib' 'gpsd' 'qtmobility' 'libwlocate' 'protobuf-c')
optdepends=('quazip: reading and displaying .kmz files'
            'shapelib: reading and displaying .shp files'
            'gpsd: position information'
            'qtmobility: required for QtLocation to work'
            'libwlocate: position information based on neighboring WLAN networks')
provides=('kdeedu-marble')
conflicts=('kdeedu-marble')
install=$pkgname.install
source=(http://download.kde.org/stable/$_kdever/src/marble-$_kdever.tar.xz)
md5sums=('c102d058423e0cee1ee964eebe6ac6c2')

build() {
 cd "$pkgname-$_kdever"
 cmake -DBUILD_HARMATTAN_ZOOMINTERCEPTO=ON \
       -DBUILD_INHIBIT_SCREENSAVER_PLUG=ON \
       -DBUILD_MARBLE_APPS=ON \
       -DBUILD_MARBLE_EXAMPLES=ON \
       -DBUILD_MARBLE_TESTS=ON \
       -DBUILD_MARBLE_TOOLS=ON \
       -DBUILD_TESTING=ON \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_BUILD_TYPE=Release \
       -DQTONLY=TRUE \
       -DWITH_DESIGNER_PLUGIN=ON \
       -DWITH_Phonon=ON \
       -DWITH_QextSerialPort=ON \
       -DWITH_QtLocation=ON \
       -DWITH_libgps=ON \
       -DWITH_liblocation=OFF \
       -DWITH_libshp=ON \
       -DWITH_libwlocate=ON \
       -DWITH_quazip=ON \
       -DBUILD_WITH_DBUS=ON \
       -DMOBILE=ON
 make
}

package() {
 cd "$pkgname-$_kdever"
 make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
