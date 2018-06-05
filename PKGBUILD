# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=cachy
pkgbase='python-cachy'
pkgname=('python-cachy' 'python2-cachy')
pkgver=0.1.1
pkgrel=1
pkgdesc="Cachy provides a simple yet effective caching library."
arch=('any')
url=https://github.com/sdispater/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('40b3ca1c57d0254c7d6d37920baadbb32a7e7cb7585e94f50764ad52ac016822')

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

package_python2-cachy() {
  depends=('python2')
  optdepends=(
    'python2-memcached: support for memcached stores'
    'python2-pylibmc: support for memcached stores'
    'redis: support for redis stores')

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-cachy() {
  depends=('python')
  optdepends=(
    'python-memcached: support for memcached stores'
    'python-pylibmc: support for memcached stores'
    'redis: support for redis stores')

  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
