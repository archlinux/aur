# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-git
pkgver=r931.546d04d
pkgrel=3
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
arch=('i686' 'x86_64')
url="https://www.orocos.org/kdl"
license=('GPL')
depends=(eigen)
makedepends=(cmake)
provides=(orocos-kdl)
conflicts=(orocos-kdl)
source=(git+https://github.com/orocos/orocos_kinematics_dynamics)
sha256sums=('SKIP')

_dir=orocos_kinematics_dynamics
_pkgname=orocos_kdl

pkgver() {
  cd "${srcdir}/${_dir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_dir}/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_dir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
