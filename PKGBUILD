# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-defcon
pkgname=(python-defcon python2-defcon)
_pkgname=defcon
pkgver=0.3.4
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications.'
arch=('any')
url='https://github.com/typesupply/defcon'
license=('MIT')
depends=('python' 'python-fonttools' 'python-ufolib'
         'python2' 'python2-fonttools' 'python2-ufolib')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('49ab636bd21825953280f1dc4ee9b2974352b4ee44997aad37730cf2c4e707cd')

package_python-defcon() {
  depends=('python' 'python-fonttools' 'python-ufolib')
  provides=('python-defcon')

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

package_python2-defcon() {
  depends=('python2' 'python2-fonttools' 'python2-ufolib')
  provides=('python2-defcon')

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
