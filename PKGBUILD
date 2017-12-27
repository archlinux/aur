# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock-qt5
pkgver=1.3.0
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

sha512sums=('7e8212d42b526ab885121c0f49b53a469a4fc407099a4a0060372410de55919a4ee12109dff3b9088d66cb8ecaa80d26738e8f66dc8a9a9cf3573923a9fa4b6d'
            'fa1c6ec044862cbdcdd3a4a139829e8bd483bec1111597f598123a36a7f558e82ef57f401947028ee1683b89094c2dd100638657aa4706306c85383f2bf2b74a')
