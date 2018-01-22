# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pyBigWig
pkgbase='python-pybigwig'
pkgname=('python-pybigwig' 'python2-pybigwig')
pkgver=0.3.10
pkgrel=1
pkgdesc="A Python extension for quick access to bigWig and bigBed files"
arch=('any')
url="https://pypi.python.org/pypi/pybigwig"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/9b/a2/322da414cdff7d3da7084388d2e65c6136722b744290619689d70e625058/pyBigWig-0.3.10.tar.gz)
sha256sums=('a409d67a744e099260c0d17c7b98a4250f41de0daa9ef32bf7512b0cd35f0039')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pybigwig() {
  depends=('curl' 'python2' 'python2-numpy')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}

package_python-pybigwig() {
  depends=('curl' 'python' 'python-numpy')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}
