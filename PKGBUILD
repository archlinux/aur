# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pycrashreport
_pkgname="${pkgname#python-}"
pkgver=1.2.5
pkgrel=1
pkgdesc="Python3 parser for Apple's crash reports"
arch=('any')
url='https://github.com/doronz88/pycrashreport'
license=('GPL3')
depends=('python' 'python-click' 'python-cached-property' 'python-la_panic')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8a5800d792d46e5e670e4a6ff148bdd4988d43fa9c5f2eb4a29b7d2c92a5998')

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
