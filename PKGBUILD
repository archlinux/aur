# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=zict
pkgname=python38-${_pkg}
pkgver=2.2.0
pkgrel=1
pkgdesc="Useful Mutable Mappings"
arch=(any)
url="https://github.com/dask/zict/"
license=(BSD)
makedepends=(python38-setuptools)
depends=(python python38-heapdict)
checkdepends=(python38-pytest python38-lmdb python38-psutil)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
#source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d7366c2e2293314112dcf2432108428a67b927b00005619feefc310d12d833f3')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  pytest -vv --color=yes zict
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
