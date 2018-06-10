# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Co-maintainer: Dmitriy Morozov <archlinux@foxcub.org>

_name=fastcluster
pkgbase='python-fastcluster'
pkgname=('python-fastcluster' 'python2-fastcluster')
pkgver=1.1.25
pkgrel=1
pkgdesc="Fast hierarchical clustering routines for R and Python"
arch=('any')
url="https://pypi.python.org/pypi/fastcluster"
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('539d84d43fbe541a38d94c84bf0469c430cb7cda488364941ce57f680a07b091')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-fastcluster() {
  depends=('python2' 'python2-numpy')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.txt
}

package_python-fastcluster() {
  depends=('python' 'python-numpy')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.txt
}
