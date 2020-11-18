# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=busylight-for-humans
pkgname=busylight
pkgver=0.7.6
pkgrel=0
pkgdesc='Control USB connected presence lights from multiple vendors'
arch=('i686' 'x86_64')
url='https://github.com/JnyJny/busylight'
license=('Apache')
makedepends=('python-setuptools' 'python-poetry')
depends=(
  'python' 'python-bitvector-for-humans' 'python-click' 'python-hidapi'
  'python-typer' 'python-webcolors'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('68168c0347820e8ae139baa29819388584a6fa8e4de45077efd3baeea58c46e1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  poetry build
  tar xf dist/${_pkgname}-${pkgver}.tar.gz
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${_pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
