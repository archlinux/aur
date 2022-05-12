# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_base=flake8-debugger
pkgname=python-${_base}
pkgver=4.1.2
pkgrel=1
pkgdesc="ipdb/pdb statement checker plugin for flake8"
url="https://github.com/JBKahn/${_base}"
depends=(flake8 python-pycodestyle)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('2f65ebe2c97d144e2104142f5739998e7b09937c27c1710e4a5e26c1837895b834293543f574ac4872229533213d26436cc8598afabf283ede8b4fdc6fdbb1ed')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python test_linter.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
