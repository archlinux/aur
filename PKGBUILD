# Maintainer: kmille github@androidloves.me

pkgname=borgctl
pkgver=0.4.11
pkgrel=1
pkgdesc="borgctl - borgbackup without bash scripts"
arch=('any')
url="https://github.com/kmille/borgctl"
license=('GPL-3.0-or-later')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(python python-ruamel-yaml)
source=(https://github.com/kmille/borgctl/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('f5b0c10685727df79efad5ca3ab518951e5713d9cc98d2cb85f7dd1cafb98a32')

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
