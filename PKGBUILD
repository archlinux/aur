# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-python2
_pkgname=orocos_kinematics_dynamics
pkgver=1.3.0
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains (Python2 binding)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('orocos-kdl' 'python2')
makedepends=('cmake' 'python2-sip')
source=(https://github.com/orocos/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('09ff63f74f1eac3ee8b1090364e0d95b4ae96c9d4435ca34adacb3ded7385f948ddca9be2c1c2c2214c9342b17bbffb7da89ba9b7cd402e7fd4f2c6dbd06a930')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/python_orocos_kdl"
	
  # determine python's site-package directory
  _packagesdir=`python2 -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(plat_specific=1))"`
	
  # specify python2 manually
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPython_ADDITIONAL_VERSIONS="2.7;2.6;2.5;2.4;2.3;2.2;2.1;2.0" \
    -DPYTHON_SITE_PACKAGES_INSTALL_DIR=${_packagesdir} .
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/python_orocos_kdl"

  make DESTDIR="${pkgdir}" install
}

