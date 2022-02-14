# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=guesslang
pkgdesc="Detect the programming language of a source code"
pkgver=2.2.1
pkgrel=1
arch=(any)
url="https://github.com/yoeo/${pkgname}"
license=(MIT)
depends=(python-tensorflow)
makedepends=(python-pytest-runner python-setuptools)
checkdepends=(python-typing_extensions)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('fceb1ac9bee2fa7d4cf19f79171baddba94c29374e5d488493e29e8ce38cde1f07a1a5d79b84477828f4d356afd59b7544b1f728e0c5a84f14c6c807d0f4c36d')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  PYTHONPATH="${PWD}/build/lib/${pkgname}:${PYTHONPATH}" python -m pytest tests
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
