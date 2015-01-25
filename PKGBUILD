# Maintainer: James An <james@jamesan.ca>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=makro
pkgver=1.0
pkgrel=5
pkgdesc="A simple KDE4 frontend for Xnee and Xbindkeys."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/Makro?content=88647"
license=('GPL')
depends=('kdelibs' 'xbindkeys')
makedepends=('cmake' 'automoc4')
source=(
    "http://kde-apps.org/CONTENT/content-files/88647-$pkgname.tar.gz"
    'patch'
)
md5sums=(
    '43f286516fd24890b222054b3931d5fa'
    '7d51848f46784b1ac768a9ba16dd14ee'
)

prepare() {
    cd $pkgname

    mkdir -p build
    patch -p1 < ../patch
}

build() {
    cd $pkgname/backend
    qmake
    make
    cp release ../makrod
}

package() {
    cd $pkgname

    cmake -D CMAKE_INSTALL_PREFIX=`kde4-config --prefix` -D CMAKE_BUILD_TYPE=release --build build .
    make DESTDIR=$pkgdir install
}
