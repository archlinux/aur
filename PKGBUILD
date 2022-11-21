# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-tinycss2
pkgver=1.2.1
pkgrel=1
pkgdesc="Low-level CSS parser for Python"
url="https://pypi.python.org/pypi/tinycss2"
license=('BSD')
arch=('any')
depends=('python38-webencodings')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
checkdepends=('python38-pytest')
_css_tests_commit=c5749e51dda3868b3e8062e65a36584c2fec8059
source=("https://pypi.io/packages/source/t/tinycss2/tinycss2-$pkgver.tar.gz"
        css-parsing-tests-$_css_tests_commit.tar.gz::https://github.com/SimonSapin/css-parsing-tests/archive/$_css_tests_commit.tar.gz)
sha512sums=('633198637f1d7cb802d1a7336a01447fc6b902cda1ade6c526e403fc2a5319277e1457c68a06780f7a6254d4c0dbf42df5d32969536ea697887a2de3e98a5f1a'
            'ef44eb1144a6484f308fabe4187310b2ef0067f328bf5213969d87c475fccae3d716dc66640a0a554ab2a3d7da0efb3a168a288ac6eef7722f3ae46959943b49')

prepare() {
  cd tinycss2-$pkgver
  cp ../css-parsing-tests-$_css_tests_commit/* tests/css-parsing-tests/
}

build() {
  cd tinycss2-$pkgver
  python3.8 -m build -nw
}

check() {
  cd tinycss2-$pkgver
  PYTHONPATH=. pytest
}

package() {
  cd tinycss2-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
