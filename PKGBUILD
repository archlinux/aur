# Maintainer: kmille github@androidloves.me

pkgname=borgctl
pkgver=0.5.0
pkgrel=1
pkgdesc="borgctl - borgbackup without bash scripts"
arch=('any')
url="https://github.com/kmille/borgctl"
license=('GPL-3.0-or-later')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(python python-ruamel-yaml)
source=(https://github.com/kmille/borgctl/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('fcf29c707f08d6044e9c9978353df723f5ea7400e9683a17e53ee9df2670cc74')

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
