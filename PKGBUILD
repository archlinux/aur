# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=locket
pkgname=python38-${_pkg}
pkgver=1.0.0
pkgrel=1
pkgdesc="File-based locks for Python"
arch=(any)
url="https://github.com/mwilliamson/locket.py"
license=(BSD)
makedepends=(python38-setuptools)
depends=(python38)
checkdepends=(python38-pytest python38-spur)
# No tests in pypi tarballs
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('1017278428998ac23c0716660587eeb39f069493d39922b7f5ae6c39c62f86c6')

build() {
  cd ${_pkg}.py-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}.py-${pkgver}
  PYTHONPATH="${PWD}/build/lib/" pytest
}

package() {
  cd ${_pkg}.py-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # Install license file
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
