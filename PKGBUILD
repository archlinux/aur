# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=lzstring
pkgbase='python-lzstring'
pkgname=('python-lzstring' 'python2-lzstring')
pkgver=1.0.3
pkgrel=2
pkgdesc="LZ-string compression for Python"
arch=('any')
url="https://pypi.python.org/pypi/lzstring"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/2b/e0/06231b1114cae946b6d3505ab8157f7308b207e3f8e3eb58334769dab6c0/lzstring-1.0.3.tar.gz
  https://raw.githubusercontent.com/gkovacs/lz-string-python/master/LICENSE.md
)
sha256sums=(
  'd54dd5a5f86837ccfc1343cc9f1cb0674d2d6ebd4b49f6408c35104f0a996cb4'
  'a2589e8eae78aab39a3b75a9548291f005502bd92b8bea0044cd15ddeb8ba402'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-lzstring() {
  depends=('python2' 'python2-future')

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-lzstring() {
  depends=('python' 'python-future')

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
