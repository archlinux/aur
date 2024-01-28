# Maintainer: kmille github@androidloves.me

pkgname=borgctl
pkgver=0.4.7
pkgrel=1
pkgdesc="borgctl - borgbackup without bash scripts"
arch=('any')
url="https://github.com/kmille/borgctl"
license=('GPL3')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(python python-ruamel-yaml)
source=(https://github.com/kmille/borgctl/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('801a7cfb549af6f10a43b8506a70fec49d6de3cde14eeb4a07d6230a7693d62f')

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
