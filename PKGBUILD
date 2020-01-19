# Maintainer: Raymo111 <hi@raymond.li>
# Contributor: James An <james@jamesan.ca>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=makro
pkgver=1.0
pkgrel=6
pkgdesc="A simple KDE4 frontend for Xnee and Xbindkeys."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/Makro?content=88647"
license=('GPL')
depends=('kdelibs4support' 'xbindkeys')
makedepends=('cmake' 'automoc4')
source=(
    "https://github.com/Raymo111/makro/raw/master/$pkgname.tar.gz"
    'patch'
)
sha256sums=('f3cd11acfd196197239b66e5cd3ab313881b42c950f6949ec75375c1f3b0d191'
            'fa85e695a376dbf16661e0f09a21ab05a4f1672afce3279062ac3ca028bd1768')

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

#    cmake -D CMAKE_INSTALL_PREFIX=`kde-config --prefix` -D CMAKE_BUILD_TYPE=release --build build .
    cmake -D CMAKE_BUILD_TYPE=release --build build .
    make DESTDIR=$pkgdir install
}
