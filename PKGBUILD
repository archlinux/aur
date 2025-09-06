# Maintainer: simon0302010 <simon0302010@gmail.com>
pkgname=metaclean-git
_pkgname=metaclean
pkgver=0.1.1
pkgrel=1
pkgdesc="App to clean metadata from multiple images"
arch=('any')
url="https://github.com/simon0302010/metaclean"
license=('GPLv3')
depends=('python' 'python-pyqt5' 'exiftool')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
