# Maintainer: Agustin Carrasco <asermax at gmail dot com>
pkgname=plasma5-runners-nordvpn
reponame=NordVPNKrunner
pkgver=2.1.3
pkgrel=1
pkgdesc="Nordvpn plasma runner"
arch=("any")
url="https://github.com/alex1701c/${reponame}"
license=("MIT")
depends=("nordvpn-bin" "krunner5" "kcmutils5")
makedepends=("cmake" "extra-cmake-modules" "gettext" "qt5-tools")
source=("https://github.com/alex1701c/${reponame}/archive/${pkgver}.tar.gz"
        "https://s1.nordcdn.com/nordvpn/media/1.170.0/images/global/favicon/apple-touch-icon-57x57.png")
md5sums=('eeeddbf1ced6ccf2e0aaf36e107a72f3'
         '45c79777d364ca2cc1665165aca77ea6')

build () {
  cd "${reponame}-${pkgver}"
    mkdir -p build
    cd build

    cmake -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
}

package() {
  cd "${reponame}-${pkgver}/build"
    make DESTDIR=${pkgdir} install

    cd ../..
    mkdir ${pkgdir}/usr/share/pixmaps
    cp -p apple-touch-icon-57x57.png ${pkgdir}/usr/share/pixmaps/nordvpn.png
}
