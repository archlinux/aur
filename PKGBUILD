# Maintainer: Robert Falkenberg <falkenber9@gmail.com>

pkgname=python-pysim-git
_pyname=${pkgname#python-}
_pyname=${_pyname%-git}
pkgver=1.0.r520.g219a5f36
pkgrel=1
pkgdesc='A python tool to program SIMs / USIMs / ISIMs'
arch=('any')
url='https://osmocom.org/projects/pysim/wiki'
license=('GPL2')
depends=('python'
         'python-bidict'
         'python-cmd2>=1.3.0'
         'python-colorlog'
         'python-construct>=2.9'
         'python-gsm0338'
         'python-jsonpath-ng'
         'python-pyscard'
         'python-pyserial'
         'python-pytlv'
         'python-termcolor'
         'python-yaml>=5.1')
makedepends=('python-setuptools' 'git')
provides=('python-pysim')
source=('git+https://git.osmocom.org/pysim')
sha256sums=('SKIP')

pkgver() {
  cd ${_pyname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^\(v\)\1*//'
}

package() {
  install=$pkgname.install
  cd "${srcdir}/${_pyname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
