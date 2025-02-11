# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=argparse-range
pkgname=python-$_pkgname-git
pkgver=0.1.2.r1.9582200
pkgrel=1
pkgdesc='Easily check that an argument is within a range for argparse'
arch=(any)
url=https://github.com/aatifsyed/argparse-range
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-poetry-core
  python-installer
)
provides=(python-$_pkgname)
conflicts=(python-$_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
