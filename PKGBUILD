# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-fontmath
pkgname=(python-fontmath python2-fontmath)
_pkgname=fontMath
pkgver=0.4.2
pkgrel=2
pkgdesc='A set of objects for performing math operations on font data.'
arch=('any')
url='https://github.com/typesupply/fontMath'
license=('MIT')
depends=('python' 'python-fonttools' 'python-ufolib'
         'python2' 'python2-fonttools' 'python2-ufolib')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('de8d28ec5f92c3c5d8af83a2b5c0cfa41834e3fc49e82befde4cde3eea5d74f4')

package_python-fontmath() {
  depends=('python' 'python-fonttools' 'python-ufolib')
  provides=('python-fontmath')

  cd "${srcdir}"

  # install the wheel
  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="${pkgdir}" \
    --ignore-installed \
    --no-deps \
    ${_pkgname}-${pkgver}-py2.py3-none-any.whl

  # compile to pyo
  python -O -m compileall "${pkgdir}"
}

package_python2-fontmath() {
  depends=('python2' 'python2-fonttools' 'python2-ufolib')
  provides=('python2-fontmath')

  cd "${srcdir}"

  # install the wheel
  PIP_CONFIG_FILE=/dev/null pip2 install \
    --isolated \
    --root="${pkgdir}" \
    --ignore-installed \
    --no-deps \
    ${_pkgname}-${pkgver}-py2.py3-none-any.whl

  # compile to pyo
  python2 -O -m compileall "${pkgdir}"
}
