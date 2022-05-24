# Contributor: Jerry Lin <jerry73204 at gmail dot com>
_base=kafka
pkgname=python-${_base}
pkgver=2.0.2
pkgrel=1
pkgdesc='Python client for Apache Kafka'
arch=('x86_64')
url="https://github.com/dpkp/${_base}-python"
license=('Apache')
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('e193a8fe5852d2134e854749115feba46a0b8ff748336989a27bf56acba1124dbb8a5d841670a67ee26eef030a686d931d03d329f978b2eef7904183e83d2594')

build() {
  cd ${_base}-python-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-python-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
