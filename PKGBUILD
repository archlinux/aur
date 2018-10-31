# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-ufolib
pkgname=(python-ufolib python2-ufolib)
_pkgname=ufoLib
pkgver=2.3.2
pkgrel=1
pkgdesc='A low-level UFO reader and writer.'
arch=('any')
url='https://github.com/unified-font-object/ufoLib'
license=('BSD')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('079cfbfb0dbaf27347d8a818c494856853ee9f21e83d724cf99d572c8bdf5726')

package_python-ufolib() {
  depends=('python' 'python-fonttools')
  provides=('python-ufolib')

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

package_python2-ufolib() {
  depends=('python2' 'python2-fonttools')
  provides=('python2-ufolib')

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
