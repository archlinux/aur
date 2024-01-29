# Maintainer: kmille github@androidloves.me

pkgname=borgctl
pkgver=0.4.9
pkgrel=1
pkgdesc="borgctl - borgbackup without bash scripts"
arch=('any')
url="https://github.com/kmille/borgctl"
license=('GPL3')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(python python-ruamel-yaml)
source=(https://github.com/kmille/borgctl/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('d1271cd25d3ef6799b9bd98128193bb7c06cdb4ad43d268a0fea8c86e66ac5e4')

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
