# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Rax Garfield <admin@dvizho.ks.ua>

_pkgname=qutepart
pkgname=qutepart-git
pkgver=3.3.3.r4.g9cca26c
pkgrel=1
pkgdesc='Code editor component for PyQt and Pyside'
arch=(any)
url=https://github.com/hlamer/qutepart
license=(LGPL)
makedepends=(git python-build python-installer python-wheel python-setuptools)
depends=(python-pyqt5)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/hlamer/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  git -C $pkgname clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
