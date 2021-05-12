# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=busylight-for-humans
pkgname=busylight
pkgver=0.9.0
pkgrel=1
pkgdesc='Control USB connected presence lights from multiple vendors'
arch=('i686' 'x86_64')
url='https://github.com/JnyJny/busylight'
license=('Apache')
makedepends=('python-setuptools' 'python-poetry')
depends=(
  'python' 'python-bitvector-for-humans' 'python-click' 'python-hidapi'
  'python-typer' 'python-webcolors' 'uvicorn' 'python-fastapi'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('deb2a22b394c384dae5d3a0ad1307cf821f37b647a582fd7fa06567c5b6cc4c4')

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
