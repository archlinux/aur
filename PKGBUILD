# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock
pkgver=1.4.0
pkgrel=1
pkgdesc='Modern looking music player designed to provide an easy and pretty music browser based on cover art'
arch=('x86_64')
url='http://seb-apps.github.io/yarock/'
license=('GPL3')
depends=('hicolor-icon-theme' 'htmlcxx' 'taglib' 'qt5-base')
makedepends=('cmake' 'mpv' 'ninja' 'phonon-qt5' 'qt5-tools' 'vlc')
optdepends=('mpv: Alternative audio backend'
            'phonon-qt5: Default audio backend'
            'vlc: Alternative audio backend')
source=("https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_Sources.tar.gz")
sha256sums=('fa55369a4d33d8d30828b6c4deb00e3bef15c9fdf52ed43e93d41f2297ee53f9')

prepare() {
  sed -i 's|/share/appdata|/share/metainfo|
          /\/share\/pixmaps\//d' Yarock_${pkgver}_Sources/CMakeLists.txt
}

build() {
  cmake -S Yarock_${pkgver}_Sources -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_MPV=ON \
    -DENABLE_VLC=ON \
    -DENABLE_PHONON=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
