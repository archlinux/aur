# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics3-scanner
_pkgname=${pkgname//-/_}
pkgver=10.0.1
pkgrel=1
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-pyaml' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pytest')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
conflicts=('mathics-scanner')
replaces=('mathics-scanner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('ff096599e3b04384d7056dc9068c00d14ad62c37c9dc6fa6d1639de49b59ab9d')


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
