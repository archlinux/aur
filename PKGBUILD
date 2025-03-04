# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.33.0
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-poetry')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b5edb684b1bbaca04f78678e2567cd2bfb28980d7be025795f4c744c3c8c4e362691abc54d4c3bf7fead78709fd331e17060d33f69fb840410107269c5eb784c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
