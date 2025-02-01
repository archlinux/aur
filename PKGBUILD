# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-scanner
_pkgname=${pkgname//-/_}
pkgver=1.4.1
pkgrel=2
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-pyaml' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('a98a5ee11815bf94edf8a6f665e788915c09b9cd4fd96ed4fc26583973dc6fb1')

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
