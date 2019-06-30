# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock-mpv
pkgver=1.4.0
pkgrel=1
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=(i686 x86_64)
url="https://launchpad.net/yarock"
license=(GPL3)
depends=(qt5-base htmlcxx taglib mpv)
makedepends=(cmake qt5-tools qt5-x11extras)
provides=(yarock)
conflicts=(yarock yarock-qt5)
source=("https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_Sources.tar.gz")
sha256sums=('fa55369a4d33d8d30828b6c4deb00e3bef15c9fdf52ed43e93d41f2297ee53f9')

prepare() {
  rm -rf "build"
  mkdir "build"
}

build() {
  cd build
  cmake "../Yarock_${pkgver}_Sources" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=1 \
    -DENABLE_MPV=ON \
    -DENABLE_VLC=OFF \
    -DENABLE_PHONON=OFF \
    -DTAGLIB_MIN_VERSION=1.10
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
