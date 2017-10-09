# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock-qt5
pkgver=1.2.0
pkgrel=1
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=('i686' 'x86_64')
url="https://launchpad.net/yarock"
license=('GPL3')
makedepends=('cmake' 'mpv' 'qt5-tools' 'vlc')
depends=('htmlcxx' 'qt5-x11extras' 'phonon-qt5' 'taglib>=1.10')
optdepends=('mpv: alternative engine'
            'vlc: alternative engine')
source=("https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_Sources.tar.gz"
        "phonon.patch")

prepare() {
  rm -rf "build"
  mkdir "build"

  # phonon include patch
  cd "Yarock_${pkgver}_Sources"
  patch -p1 -i "${srcdir}/phonon.patch"
}

build() {
  cd build
  cmake "../Yarock_${pkgver}_Sources" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=1 \
    -DENABLE_MPV=ON \
    -DTAGLIB_MIN_VERSION=1.10
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

sha512sums=('d33614886694e2d2a363a9e60d32f956a70a153a2c64836d2b41d0d3b85c0e90147a42c3f443f4136c745f4574f4b58f981ce4c74adc8bdb8c6da9297ff256df'
            'fa1c6ec044862cbdcdd3a4a139829e8bd483bec1111597f598123a36a7f558e82ef57f401947028ee1683b89094c2dd100638657aa4706306c85383f2bf2b74a')
