# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-django-compression-middleware
pkgver=0.5.0
pkgrel=6
pkgdesc="Django middleware to compress responses using several algorithms"
arch=('any')
url="https://github.com/friedelwolff/django-compression-middleware"
license=('MPL-2.0')
depends=(
  'python'
  'python-brotli'
  'python-django'
  'python-zstandard'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

check() {
  cd "${srcdir}/${pkgname}"
  pytest
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
