# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=cyvcf2
pkgbase='python-cyvcf2'
pkgname=('python-cyvcf2' 'python2-cyvcf2')
pkgver=0.8.6
pkgrel=1
pkgdesc="Fast VCF/BCF processor in Python using Cython and htslib"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/39/c9/b2b5d29b945e5599cddc0f04aa10e7f50e45d80a32cf22aa639d0b3a201b/cyvcf2-0.8.6.tar.gz)
sha256sums=('eca706d5c94786fe94c27839772f16d0e1b04de6569857ef2180035f6d07b03d')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-cyvcf2() {
  depends=('python2' 'python2-numpy' 'htslib')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-cyvcf2() {
  depends=('python' 'python-numpy' 'htslib')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
