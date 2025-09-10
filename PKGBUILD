# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pycrashreport
_pkgname="${pkgname#python-}"
pkgver=1.2.7
pkgrel=1
pkgdesc="Python3 parser for Apple's crash reports"
arch=('any')
url='https://github.com/doronz88/pycrashreport'
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-cached-property' 'python-la_panic')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('288ff23e2eb7f8cae9e6def71429ca39c504adaec2d6f83f6303ccce70bf2398')

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
}
