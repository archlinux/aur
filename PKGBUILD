# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=nimfa
pkgbase='python-nimfa'
pkgname=('python-nimfa' 'python2-nimfa')
pkgver=1.3.4
pkgrel=1
pkgdesc="Nonnegative matrix factorization in Python"
arch=('any')
url=https://github.com/meowklaski/"${_name}"
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('651376eba6b049fe270dc0d29d4b2abecb5e998c2013df6735a97875503e2ffe')

prepare() {
  cp -a nimfa-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/nimfa-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/nimfa-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/nimfa-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-nimfa() {
  depends=('python2' 'python2-numpy' 'python2-scipy')

  cd nimfa-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.txt
}

package_python-nimfa() {
  depends=('python' 'python-numpy' 'python-scipy')

  cd nimfa-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.txt
}
