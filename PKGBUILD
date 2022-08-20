# Maintainer: Your Name <youremail@domain.com>

pkgname=python-material-color-utilities-git
_name=material-color-utilities-python
pkgver=r39.0dbf88e
pkgrel=1
pkgdesc="Python port of material-color-utilities used for Material You colors"
arch=('any')
url="https://github.com/avanishsubbiah/material-color-utilities-python"
license=('Apache')
depends=('python-pillow' 'python-regex')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
