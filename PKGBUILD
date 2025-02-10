# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pycrashreport
_pkgname="${pkgname#python-}"
pkgver=1.2.6
pkgrel=1
pkgdesc="Python3 parser for Apple's crash reports"
arch=('any')
url='https://github.com/doronz88/pycrashreport'
license=('GPL3')
depends=('python' 'python-click' 'python-cached-property' 'python-la_panic')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fbfc667753cec3be7888aeefc8d9c8dba8f7f27fdc24656d10fe6a0e8598ce49')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
