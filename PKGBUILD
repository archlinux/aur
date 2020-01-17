# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

_name=numdifftools
pkgbase=python-numdifftools
pkgname=('python2-numdifftools' 'python-numdifftools')
pkgver=0.9.39
pkgrel=2
pkgdesc='suite of tools written in _Python to solve automatic numerical differentiation problems in one or more variables'
url='https://github.com/pbrod/numdifftools/'
license=("LGPL")
arch=('i686' 'x86_64')
makedepends=('python-setuptools' 'python-numpy' 'python-scipy' 'python-algopy' 'python-statsmodels')
makedepends+=('python2-setuptools' 'python2-numpy' 'python2-scipy' 'python2-algopy' 'python2-statsmodels')
options=('!libtool')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha1sums=('336c470027eb0730e6cfec0db7710f690311b129')


prepare() {
  cp -a ${_name}-${pkgver} ${_name}-py2-${pkgver}
}

build() {
  cd "${_name}-py2-${pkgver}"
  python2 setup.py build

  cd "${_name}-${pkgver}"
  python setup.py build
}

package_python-numdifftools() {
  depends=('python-numpy' 'python-scipy' 'python-algopy' 'python-statsmodel')

  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

package_python2-numdifftools() {
  depends=('python2-numpy' 'python2-scipy' 'python2-algopy' 'python2-statsmodel')

  cd "${_name}-py2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove duplicated documentation
  rm -rf ${pkgdir}/usr/share

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

