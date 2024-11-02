# Maintainer: Dan Johansen <strit at strits dot dk>
# Contributor: Agustin Carrasco <asermax at gmail dot com>

pkgname=plasma6-runners-nordvpn
reponame=NordVPNKrunner
pkgver=3.2.0
pkgrel=1
pkgdesc="Nordvpn plasma 6 runner"
arch=("any")
url="https://github.com/alex1701c/${reponame}"
license=("MIT")
depends=("nordvpn"
        "krunner"
        "kcmutils"
        "knotifications")
makedepends=("cmake"
            "extra-cmake-modules"
            "gettext"
            "qt6-tools")
conflicts=('plasma5-runners-nordvpn')
replaces=('plasma-runners-nordvpn')
source=("https://github.com/alex1701c/${reponame}/archive/${pkgver}.tar.gz"
        "https://s1.nordcdn.com/nordvpn/media/1.170.0/images/global/favicon/apple-touch-icon-57x57.png")
md5sums=('35c9f5673e4df0a4a4bbe283efc7fe91'
         '45c79777d364ca2cc1665165aca77ea6')

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
