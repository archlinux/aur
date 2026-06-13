# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname='pycroscope'
pkgdesc='A Python type checker'
pkgver='0.4.0'
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
b2sums=(13a9906a8b8d1ef8e47c6098f47a0ffb6efd697c8999806387e3e9daccf2e69adec5533eac258cadd5c7439ecbcf8f301ca0f718dc6370b66f7d61d99388f2c9)

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
