# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Ingo Bürk <admin (at) airblader (dot) de>

pkgname=huestacean
pkgver=v2.6
pkgrel=1
pkgdesc="Philips Hue control app for desktop with screen syncing"
arch=('any')
url="https://github.com/BradyBrenot/huestacean"
license=('Apache')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-remoteobjects')
makedepends=('git' 'cmake')
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/BradyBrenot/huestacean#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    git submodule sync
    git submodule update --init --recursive

    mkdir build
    cd build
    cmake ..
    make huestacean
}

package() {
    cd "${pkgname}/build"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}