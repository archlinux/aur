# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Agustin Carrasco <asermax at gmail dot com>

pkgname=plasma6-runners-nordvpn
_reponame=NordVPNKrunner
pkgver=3.2.1
pkgrel=2
pkgdesc="Nordvpn plasma 6 runner"
arch=('x86_64' 'aarch64')
url="https://github.com/alex1701c/${_reponame}"
license=("MIT")
depends=(
        'nordvpn'
        'krunner'
        'kcmutils'
        'knotifications'
)
makedepends=(
            'cmake'
            'extra-cmake-modules'
            'gettext'
            'qt6-tools'
)
conflicts=('plasma5-runners-nordvpn')
replaces=('plasma-runners-nordvpn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alex1701c/${_reponame}/archive/${pkgver}.tar.gz"
        "https://s1.nordcdn.com/nordvpn/media/1.170.0/images/global/favicon/apple-touch-icon-57x57.png")
sha256sums=('3afb83a60066cdae4246efa70cab2c2a28a04306b70ffc5b50674de7ebeef48a'
            'd0431d5a6bfc82e8a9945c4da263afb5e99ed874bf92764f185ab4c11bf691b0')

build () {
  cd "${_reponame}-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DBUILD_WITH_QT6=ON ..
    make -j$(nproc)
}

package() {
  cd "${_reponame}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    cd ../..
    mkdir "${pkgdir}/usr/share/pixmaps"
    cp -p apple-touch-icon-57x57.png "${pkgdir}/usr/share/pixmaps/nordvpn.png"
}
