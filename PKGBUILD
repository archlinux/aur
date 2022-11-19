# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-importlib-metadata
pkgver=5.0.0
pkgrel=1
pkgdesc="Read metadata from Python packages"
url="https://importlib-metadata.readthedocs.io"
license=('Apache')
arch=('any')
depends=('python38-zipp')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest' 'python38-pep517' 'python38-pyfakefs' 'python38-pip' 'python38-tests')
source=("https://github.com/python/importlib_metadata/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b1cb91fa37ded81283e54a8d21dfe075922284ba4d702322bdc5222b04fae5fc3424bbe4dc8ed8318f77a4f241919f082e9d5df69022f903e284c829d46223b5')


build() {
  cd importlib_metadata-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python3.8 -m build -nw
}

check() {
  cd importlib_metadata-$pkgver

  python3.8 -m pytest --ignore exercises.py
}

package_python38-importlib-metadata() {
  cd importlib_metadata-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl
}
