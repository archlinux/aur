# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Faheem Pervez <trippin1@gmail.com>

pkgname=kde-thumbnailer-epub
pkgver=1.0
pkgrel=2
pkgdesc="Thumbnailer to show ePub cover previews in KDE file managers (Dolphin and Konqueror)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+ePub+Thumbnailer?content=151210"
depends=('ebook-tools' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-apps.org/CONTENT/content-files/151210-${pkgname}-${pkgver}.tar.gz")
sha256sums=('abe892ebc670e04ffbccf8ebf493fb77c69d9684fb096e9fa4e55fd4b9ed5702')

build() {
    install -d build/
    cd build/
    cmake ../${pkgname}-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
