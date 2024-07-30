# shellcheck disable=SC2034,2154,2148
# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-drf-writable-nested
pkgver=0.7.0
pkgrel=5
pkgdesc="Writable nested model serializer for Django REST Framework"
arch=('any')
url="https://github.com/beda-software/drf-writable-nested"
license=('BSD-2-Clause')
depends=(
  'python'
  'python-django'
  'python-django-rest-framework'
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
  'python-pytest-django'
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
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
