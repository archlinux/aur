# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Techcable <Techcable at techcable dot net>

pkgname=mathics3-pygments
_pkgname=${pkgname//-/_}
pkgver=10.0.0
pkgrel=1
pkgdesc="A pygments-based lexer and scanner for Mathics."
arch=('any')
url="https://github.com/Mathics3/mathics3-pygments"
license=('MIT')
depends=('mathics3-scanner>=10.0.0' 'python-pygments>=2.9')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-pyaml')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
checkdepends=("python-pytest")
conflicts=('mathics-pygments')
replaces=('mathics-pygments')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('4a4ea7787fef9f5f086b4bd900b3a7ca5c8f083e9e4619b8864edc0514994255')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export PYTHONPATH="."
  pytest tests
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

