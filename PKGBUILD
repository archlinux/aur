# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpp
pkgver=0.5
pkgrel=1
pkgdesc='Read and write Reaper RPP files with Python'
arch=('any')
url='https://github.com/Perlence/rpp'
license=('MIT')
depends=('python' 'python-attrs' 'python-ply')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest' 'python-pytest-runner')
_commit='6ea00bb6db76724d3521748b3effa7260f1ebf8e'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
