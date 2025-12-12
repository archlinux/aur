# Maintainer: conf
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=busylight_for_humans
pkgname=busylight
pkgver=0.45.2
pkgrel=1
pkgdesc='Control USB connected presence lights from multiple vendors'
arch=('any')
url='https://github.com/JnyJny/busylight'
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-hatchling')
depends=(
  'python'
  'python-busylight-core>=0.15.2'
  'python-hidapi>=0.14.0'
  'python-loguru>=0.7.3'
  'python-pyserial>=3.5'
  'python-typer>=0.16.0'
  'python-webcolors>=24.11.1'
  'python-importlib-metadata'
)
optdepends=(
  'python-fastapi: for web API support'
  'uvicorn: for web API support'
)

source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ceed9080196679335dffedccfe511b81e0241820485b1764aa68c9668d81c9cc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
