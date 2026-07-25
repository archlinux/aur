# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='pycroscope'
pkgdesc='A Python type checker'
pkgver=0.5.0
pkgrel=1
url='https://pycroscope.readthedocs.io/'
arch=(any)
license=(Apache-2.0)
checkdepends=(python-annotated-types python-attrs python-pytest)
makedepends=(python-build python-installer python-setuptools)
depends=(
  python
  python-mypy_extensions
  python-pydantic
  python-typing_extensions
  # AUR
  python-typeshed_client
)
optdepends=(
  # AUR
  'python-ast_decompiler: [full]'
  'python-asynq: [asynq]'
  'python-qcore: [asynq]'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JelleZijlstra/pycroscope/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('13d1f4cda49b1ba60ec4a6156d35e91b026f9dbeb02c630b441110366a0da0b9')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m pytest --ignore=pycroscope/test_self.py --ignore=pycroscope/test_typeshed.py
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
