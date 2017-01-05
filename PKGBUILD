# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-ufolib
pkgname=(python-ufolib python2-ufolib)
_pkgname=ufoLib
pkgver=2.0.0
pkgrel=1
pkgdesc='A low-level UFO reader and writer.'
arch=('any')
url='https://github.com/unified-font-object/ufoLib'
license=('BSD')
depends=('python' 'python-fonttools'
         'python2' 'python2-fonttools')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('0c2bff943ea66bd0c1789cbe0b1c01fc3f966c899212b8a9d3f1d456a459d60a')

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
