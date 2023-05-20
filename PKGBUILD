# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=einsumt
pkgname=python-${_base}
pkgdesc="Multithreaded version of numpy.einsum function"
pkgver=0.9.4
pkgrel=1
arch=(any)
url="https://github.com/mrkwjc/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9272db18df12db88480e94ba8717ecfb0b176f4536cd2033d7f58cb73dce397d8f042fc802b8caf84fb00e65e0d38da473d2f27d2d09021f42eaa9ed0db157fc')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python test_einsumt.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
