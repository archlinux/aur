# Maintainer:  gilcu3
# Contributor: gilcu3

_pkgname=cuso
pkgname=python-$_pkgname-git
epoch=1
pkgver=.r3.eb6d7d8
pkgrel=1
pkgdesc="(Copper)smith (So)lver which automatically finds small roots of multivariate polynomials"
arch=('x86_64')
url='https://github.com/keeganryan/cuso'
depends=('sagemath' 'msolve' 'flatter' 'python-igraph' 'python-fpylll')
makedepends=(python-build python-installer python-wheel git)
provides=(python-cuso)
license=('LGPL-3.0')
sha256sums=('SKIP')
source=("git+$url")

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  TAG="${TAG##*-}"
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}


build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
