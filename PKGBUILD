# Maintainer: oysstu <oysstu a gmail.com>

pkgname=python-orocos-kdl
pkgver=1.5.4
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains"
url="https://www.orocos.org/kdl.html"
arch=('any')
license=('LGPL-2.1-or-later')
depends=('orocos-kdl' 'python')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/orocos/orocos_kinematics_dynamics/archive/${pkgver}.tar.gz")
sha256sums=('b47c75b03d5980a8b3a5382ab1176ae552f2f5418ad42b0e530a4178e3e1c301')

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
