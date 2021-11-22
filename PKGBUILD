# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=busylight-for-humans
pkgname=busylight
pkgver=0.13.2
pkgrel=1
pkgdesc='Control USB connected presence lights from multiple vendors'
arch=('i686' 'x86_64')
url='https://github.com/JnyJny/busylight'
license=('Apache')
makedepends=('python-setuptools' 'python-poetry')
depends=(
  'python' 'python-bitvector-for-humans' 'python-click' 'python-hidapi'
  'python-loguru' 'python-typer' 'python-webcolors' 'uvicorn' 'python-fastapi'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('4e47b329780e06b4db7ae50c32add3063896d95b4c7fba1c0f627d04d89655e4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  POETRY_CACHE_DIR=${srcdir}/poetry-cache poetry build -f sdist

  cd "${srcdir}/${pkgname}-${pkgver}"
  tar xf dist/${_pkgname}-${pkgver}.tar.gz

  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
