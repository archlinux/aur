# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock-qt5
pkgver=1.1.2
pkgrel=2
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=('i686' 'x86_64')
url="https://launchpad.net/yarock"
license=('GPL3')
makedepends=('cmake' 'mpv')
depends=('qt5-x11extras' 'phonon-qt5' 'taglib')
optdepends=('mpv: alternative (working) engine')
source=("https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_source.tar.gz"
        "phonon.patch")
md5sums=('88733d9bed252c132a378dfecb158697'
         'd6f84a05159c8b7035723cbdeb6fc611')

prepare() {
  patch -p0 -i "${srcdir}/phonon.patch"
}

build() {
  mkdir build
  cd build
  cmake "../Yarock_${pkgver}_source" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=1 \
    -DENABLE_MPV=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

