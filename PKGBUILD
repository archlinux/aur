# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-scanner
_pkgname=${pkgname//-/_}
pkgver=2.0.0
pkgrel=1
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-pyaml' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('0424ae0918313640af52a7bbadc91824ca1869eb1ad0e0dd87c784c141326d9a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export PYTHONPATH="."
  pytest test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
