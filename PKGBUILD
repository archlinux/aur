# Maintainer: oysstu <oysstu a gmail.com>

pkgname=python-orocos-kdl
pkgver=1.5.3
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
url="https://www.orocos.org/kdl.html"
arch=('any')
license=('LGPL-2.1-or-later')
depends=('orocos-kdl' 'python')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/${pkgver}.tar.gz")
sha256sums=('3895eed1b51a6803c79e7ac4acd6a2243d621b887ac26a1a6b82a86a1131c3b6')

_dir=orocos_kinematics_dynamics
_pkgname=python_orocos_kdl

build() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cmake -B build -S "${srcdir}/${_dir}-${pkgver}/${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DPYTHON_SITE_PACKAGES_INSTALL_DIR=${site_packages}

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
