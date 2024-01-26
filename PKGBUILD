# Maintainer: kmille github@androidloves.me

pkgname=borgctl
pkgver=0.4.5
pkgrel=1
pkgdesc="borgctl - borgbackup without bash scripts"
arch=('any')
url="https://github.com/kmille/borgctl"
license=('GPL3')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(python python-ruamel-yaml)
source=(https://github.com/kmille/borgctl/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('597a59aa45b72b36cfee2e7014184047fdeb6ab15b28a5e372817995a3721f42')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
  # from incorrectly using a parent git checkout info.
  # https://github.com/pypa/build/issues/384#issuecomment-947675975
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
