# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-python
_dir=orocos_kinematics_dynamics
_pkgname=python_orocos_kdl
pkgver=1.4.0
pkgrel=3
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains (Python binding)"
arch=('i686' 'x86_64')
url="https://www.orocos.org/kdl"
license=('GPL')
depends=('orocos-kdl' 'python-sip4')
makedepends=('cmake' 'sip4')
source=(https://github.com/orocos/${_dir}/archive/v${pkgver}.tar.gz
        declare-assignment-operator-private-for-SIP.patch)
sha512sums=('7156465e2aff02f472933617512069355836a03a02d4587cfe03c1b1d667a9762a4e3ed6e055b2a44f1fce1b6746179203c7204389626a7b458dcab1b28930d8'
            '61a2abc5bce5e59dc3b9d6c3b4e10575053a730d08de5984da66bebcfdb4b0a7c5b5f3330974f7c44455012ba306768b8ea20b9f2e3e8a3ba0295339ce696feb')

prepare() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"

  patch -Np1 -i "$srcdir/declare-assignment-operator-private-for-SIP.patch"
}

build() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_dir}-${pkgver}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
