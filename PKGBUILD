# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=nose-progressive
pkgbase='python-nose-progressive'
pkgname=('python-nose-progressive' 'python2-nose-progressive')
pkgver=1.5.1
pkgrel=2
pkgdesc="A Python nose plugin with a progress bar and smarter tracebacks"
arch=('any')
url="https://pypi.python.org/pypi/nose-progressive"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/4d/0c/c8b64017f43cddcae7e2ed5f3d7dc8b924311094882d9d9daa7339b0ff67/nose-progressive-1.5.1.tar.gz
  https://raw.githubusercontent.com/erikrose/nose-progressive/c2011a2b82408fe18e14476b7db7202135398d63/LICENSE
)
sha256sums=(
  '44bd41344c1cc1de434a72764ed47fdbbbdbcf03c7801114c0433cd6c696cb55'
  '07a671a4d3b60c3fdd2750072437d5cab7a26a1fb52ef3cebf2e969036a4f8d4'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-nose-progressive() {
  depends=('python2' 'python2-blessings')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-nose-progressive() {
  depends=('python' 'python-blessings')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
