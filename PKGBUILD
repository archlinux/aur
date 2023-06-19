# Maintainer: Carl Smedstad <antoniovazquezblanco@gmail.com>

pkgname=python-coverxygen-git
_name=${pkgname#"python-"}
_name=${_name%"-git"}
pkgver=1.8.0
pkgrel=1
pkgdesc="Generate doxygen's documentation coverage report"
arch=(x86_64)
url="https://github.com/psycofdj/coverxygen"
license=(GPL)
makedepends=(
  python-build
  python-setuptools
  python-wheel
)
provides=('python-coverxygen')
conflicts=('python-coverxygen')
replaces=('python-coverxygen-git')
source=("${_name}::git+$url")
sha512sums=(
  'SKIP'
)

pkgver() {
  cd "${_name}"
  git describe --tag | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
