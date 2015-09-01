# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock-qt5
pkgver=1.1.4
pkgrel=1
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=('i686' 'x86_64')
url="https://launchpad.net/yarock"
license=('GPL3')
makedepends=('cmake' 'mpv')
depends=('htmlcxx' 'qt5-x11extras' 'phonon-qt5' 'taglib')
optdepends=('mpv: alternative (working) engine')
source=("https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_source.tar.gz"
        "phonon.patch")

prepare() {
  rm -rf "build"
  mkdir "build"

  # phonon include patch
  patch -p0 -i "phonon.patch"
}

build() {
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

md5sums=('794020bf0a571a24df6a6505d530f7c2'
         'b8e68d1d1aa08a6963af8b1de3baee76')
