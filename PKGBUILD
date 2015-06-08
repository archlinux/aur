# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-gimpresources
pkgver=2.1.2
pkgrel=2
pkgdesc="Plugin for KDE to display GIMP resource files like brushes and patterns as thumbnails."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://kde-apps.org/content/show.php/GimpResourcesThumbnailer?content=107128"
depends=('kdelibs' 'gimp')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aclemens/GimpResourcesThumbnailer/archive/${pkgver}.tar.gz")
sha256sums=('a8e964e74a4be92070a9817247d5e7dc12ef4add0fc8165cffbc1d24b5e8ac51')

build() {
    install -d build/
    cd build/
    cmake ../GimpResourcesThumbnailer-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
