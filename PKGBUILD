# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=peru-git
pkgdesc='A tool for fetching code'
url='https://github.com/buildinspace/peru'
license=('MIT')
pkgver=696.c0e6c55
pkgver() {
  cd "$srcdir/peru"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=1
arch=('any')
# Asyncio and pathlib are standard in Python 3.4, so they're not in the
# dependencies list.
depends=(python python-yaml git)
makedepends=(python-build python-installer python-hatch)
optdepends=(
  'mercurial: fetching from hg repos'
  'subversion: fetching from svn repos'
)
conflicts=(peru)
source=('git+https://github.com/buildinspace/peru')
md5sums=('SKIP')

build() {
  cd "$srcdir/peru"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/peru"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
