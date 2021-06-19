# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl
pkgver=1.5.0
pkgrel=2
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="https://www.orocos.org/kdl"
license=('GPL')
depends=(eigen)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/v${pkgver}.tar.gz")
sha256sums=('6d4b04c465f0974286fbb419c40e3aca145f616571f2462e2696b830288234a9')

_dir=orocos_kinematics_dynamics
_pkgname=orocos_kdl

build() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  find ${pkgdir}/usr -maxdepth 1 -type f -exec rm {} \;
}
