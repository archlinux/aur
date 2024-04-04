# Maintainer: Dan Johansen <strit at strits dot dk>
# Contributor: Agustin Carrasco <asermax at gmail dot com>

pkgname=plasma-runners-nordvpn
reponame=NordVPNKrunner
pkgver=3.0.0
pkgrel=1
pkgdesc="Nordvpn plasma runner"
arch=("any")
url="https://github.com/alex1701c/${reponame}"
license=("MIT")
depends=("nordvpn" "krunner" "kcmutils")
makedepends=("cmake" "extra-cmake-modules" "gettext" "qt6-tools")
conflicts=('plasma5-runners-nordvpn')
source=("https://github.com/alex1701c/${reponame}/archive/${pkgver}.tar.gz"
        "https://s1.nordcdn.com/nordvpn/media/1.170.0/images/global/favicon/apple-touch-icon-57x57.png"
        "https://github.com/alex1701c/NordVPNKrunner/commit/c9ce1a8cdbed63ee872f661c99120a86e8818910.patch")
md5sums=('813e572250d28cbe8cfdd74324808120'
         '45c79777d364ca2cc1665165aca77ea6'
         '849bab482635f266229933c22d3c3dd7')

prepare () {
  cd "${reponame}-${pkgver}"
  patch -Np1 -i ../c9ce1a8cdbed63ee872f661c99120a86e8818910.patch
}

build () {
  cd "${reponame}-${pkgver}"
    mkdir -p build
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_WITH_QT6=ON ..
    make -j$(nproc)
}

package() {
  cd "${reponame}-${pkgver}/build"
    make DESTDIR=${pkgdir} install

    cd ../..
    mkdir ${pkgdir}/usr/share/pixmaps
    cp -p apple-touch-icon-57x57.png ${pkgdir}/usr/share/pixmaps/nordvpn.png
}
