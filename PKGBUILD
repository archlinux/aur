# Maintainer: redponike

pkgname=python-trubar
_pkgname=${pkgname#python-}
pkgver=0.3.4
pkgrel=2
pkgdesc="Translation and localization of Python programs via modification of source files."
arch=('any')
url="https://github.com/janezd/trubar"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-libcst' 'python-yaml')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08f5351d8cf8a96ee5f14a6eb44405b91c3898af655bcee89aa4519eb1193696')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -vv
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
