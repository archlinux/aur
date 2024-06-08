# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-qtawesome-git
pkgver=1.3.1.r1.g68abecc
pkgrel=1
pkgdesc='Enables iconic fonts such as Font Awesome and Elusive Icons in PyQt and PySide applications'
arch=(any)
url=https://github.com/spyder-ide/qtawesome
license=(MIT)
depends=(python-qtpy)
makedepends=(git python-build python-installer python-setuptools python-wheel)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
