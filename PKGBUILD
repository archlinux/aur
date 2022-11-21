# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-typeguard
pkgver=2.13.3
pkgrel=1
pkgdesc="Run-time type checker for Python"
url="https://github.com/agronholm/typeguard"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools-scm')
checkdepends=('mypy' 'python38-pytest-cov' 'python38-typing_extensions')
source=("https://github.com/agronholm/typeguard/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('26c31ee9670650d1969320187a924d29d986894a38f1026af58f705b132b64be3b6e2ac34729f966f5d302d486334b5a5d9e65fb206245b82b0ff0852020b609')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd typeguard-$pkgver
  python3.8 setup.py build
}

check() {
  cd typeguard-$pkgver
  # https://github.com/agronholm/typeguard/issues/176
  PYTHONPATH="$PWD/build/lib" MYPYPATH="$PWD/build/lib" pytest --deselect tests/mypy/test_type_annotations.py::test_positive
}

package() {
  cd typeguard-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
