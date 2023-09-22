# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-qtpy-git
pkgver=2.4.0.r8.g1faf764
pkgrel=1
pkgdesc='Provides a uniform layer to support PyQt5 and PySide2 with a single codebase'
arch=(any)
url=https://github.com/spyder-ide/qtpy
license=(MIT)
depends=(python-pyqt5)
makedepends=(git python-build python-installer python-wheel python-setuptools)
optdepends=('python-pyqt5: Qt5 Python bindings'
            'python-pyqt6: Qt6 Python bindings'
            'python-pyqt5-webengine: Qt5-WebEngine python bindings'
            'python-pyqt6-webengine: Qt6-WebEngine python bindings'
            'pyside2: PySide Qt5 Python bindings'
            'pyside6: PySide Qt6 Python bindings')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/{pkgname%-git}"
}
