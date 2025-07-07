# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ormsgpack
pkgname=python-${_name}
pkgver=1.10.0
pkgrel=1
pkgdesc="Fast, correct Python msgpack library supporting dataclasses, datetimes, and numpy."
arch=('any')
url='https://github.com/aviramha/ormsgpack'
license=('Apache-2.0 OR MIT')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a9ab2b3eac58362e86db43c9fbfd5702795b389a6f981a631228c044af60c21')
depends=('python' 'gcc-libs')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-msgpack' 'python-numpy' 'python-pendulum' 'python-pydantic' 'python-pytest' 'python-pytest-benchmark' 'python-dateutil' 'python-pytz' 'python-tzdata')
optdepends=('python-aiohttp: aiohttp')

prepare(){
  cd "${srcdir}"/${_name}-${pkgver}

}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv

  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
