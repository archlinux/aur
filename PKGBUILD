# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.41.0
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli python-yaml)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-poetry')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bb75c928eeb0d2103084d4ca1276fff3e186b8f2bdb3c4b7c139914af1619e9293a5d3189d06be394bee90c734eb8d9b4363bf0ac9713d38cf62dc5ca3423f55')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
