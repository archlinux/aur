# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=jarowinkler
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc='A library for fast approximate string matching using Jaro and Jaro-Winkler similarity'
arch=(x86_64)
url='https://github.com/maxbachmann/JaroWinkler'
license=(MIT)
depends=(python python-rapidfuzz)
makedepends=(python-pip python-build python-installer python-setuptools python-scikit-build ninja)
checkdepends=(python-hypothesis python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7640c79f8d2d5e9eed6691cb49e3018a23b2319daad9a2178df253368b5432b7')

build() {
  cd $_name-$pkgver
  JAROWINKLER_BUILD_EXTENSION=1 \
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
