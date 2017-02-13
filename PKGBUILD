# Maintainer: Wojciech Szymecki <w.szymecki-at-g;mail-com>
_name="parsimonious"

pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=0.7.0
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/${_name}/${pkgver}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('396d424f64f834f9463e81ba79a331661507a21f1ed7b644f7f6a744006fd938')

prepare() {
    cp -r "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python3 setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-parsimonious() {
  pkgdesc="Fast parser based on parsing expression grammars (PEGs) - Python 3 version."
  depends=('python>=3.2')

  cd "${srcdir}/${_name}-${pkgver}"

  python3 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-parsimonious() {
  pkgdesc="Fast parser based on parsing expression grammars (PEGs) - Python 2 version."
  depends=('python>=2.6')

  cd "${srcdir}/${_name}-${pkgver}-python2"

  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
