# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=partd
pkgname=python38-${_pkg}
pkgver=1.3.0
pkgrel=1
pkgdesc="Concurrent appendable key-value storage"
arch=(any)
url="https://github.com/dask/partd"
license=(BSD)
makedepends=(python38-setuptools)
depends=(
    python38
    python38-locket
    python38-toolz
)
optdepends=(
    python38-blosc
    python38-numpy
    python38-pandas
    python38-pyzmq
)
checkdepends=(
    python38-pytest
    python38-blosc
    python38-numpy
    python38-pandas
    python38-pyzmq
)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('ce91abcdc6178d668bcaa431791a5a917d902341cb193f543fe445d494660485')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}"/build/lib pytest
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # Install license file
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
