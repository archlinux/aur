# Maintainer: Agustin Carrasco <asermax at gmail dot com>
pkgname=plasma5-runners-nordvpn
reponame=NordVPNKrunner
pkgver=2.1.0
pkgrel=1
pkgdesc="Nordvpn plasma runner"
arch=("any")
url="https://github.com/alex1701c/${reponame}"
license=("MIT")
depends=("nordvpn-bin" "qt5-base" "krunner" "plasma-framework")
makedepends=("cmake" "extra-cmake-modules" "gettext" "sed")
source=("https://github.com/alex1701c/${reponame}/archive/${pkgver}.tar.gz")
md5sums=('1c65eb2578217931dfb768cd19be1336')

build () {
  cd "${reponame}-${pkgver}"
  mkdir -p build
  cd build

  cmake -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release ..
  make -j$(nproc)
}

package() {
  cd "${reponame}-${pkgver}/build"
  sudo make install
  sudo curl https://s1.nordcdn.com/nordvpn/media/1.170.0/images/global/favicon/apple-touch-icon-57x57.png -o /usr/share/pixmaps/nordvpn.png
}
