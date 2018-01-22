# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pyupset
pkgbase='python-pyupset'
pkgname=('python-pyupset' 'python2-pyupset')
pkgver=0.1.1.post7
pkgrel=1
pkgdesc="Python implementation of the UpSet visualisation suite by Lex et al."
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/70/4e/ed9ef0952561292b6138c9c1a6eb8362ad13df227174ddc3057c69db5ed7/PyUpSet-0.1.1.post7.tar.gz#md5=474b1ea07fea4c9566b2aea7e0b0b7c2)
sha256sums=('eb413e67109c1609464fda325fd1b6703bdfacff93e83cfd02e9ba2b937c230f')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pyupset() {
  depends=('python2' 'python2-numpy' 'python2-pandas')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-pyupset() {
  depends=('python' 'python-numpy' 'python-pandas')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
