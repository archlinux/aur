# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-fontmath
pkgname=(python-fontmath python2-fontmath)
_pkgname=fontMath
pkgver=0.4.4
pkgrel=1
pkgdesc='A set of objects for performing math operations on font data.'
arch=('any')
url='https://github.com/typesupply/fontMath'
license=('MIT')
depends=('python' 'python-fonttools' 'python-ufolib'
         'python2' 'python2-fonttools' 'python2-ufolib')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('0be82c86eeb620608f7d6c4509e66246d02b95641d686cb8df668a6697ee8f9d')

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
