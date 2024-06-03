pkgname=python-pyfmi
pkgver=2.13.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz" setuptools.patch)
sha256sums=('846f8bd80988a891be2c7fecb2d6faf2b459f61788164b628a7a69a1461ec811' SKIP)

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  patch -p1 -i "${srcdir}"/setuptools.patch
}

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}


