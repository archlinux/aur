# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Košava <kosava at archlinux dot us>

pkgname=yarock-mpv
pkgver=1.4.0
pkgrel=2
pkgdesc="Qt Modern Music Player with collection browse based on cover art"
arch=(i686 x86_64)
url="https://launchpad.net/yarock"
license=(GPL-3.0-or-later)
depends=(qt5-base htmlcxx taglib1 mpv)
makedepends=(cmake qt5-tools qt5-x11extras)
provides=(yarock)
conflicts=(yarock)
source=("https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_Sources.tar.gz")
sha256sums=('fa55369a4d33d8d30828b6c4deb00e3bef15c9fdf52ed43e93d41f2297ee53f9')

build() {
  local _flags=(
    -DENABLE_QT5=1
    -DENABLE_MPV=ON
    -DENABLE_VLC=OFF
    -DENABLE_PHONON=OFF
    -DTAGLIBCONFIG_EXECUTABLE:FILEPATH=/usr/bin/taglib1-config
  )

  cmake -B build -S "Yarock_${pkgver}_Sources" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
