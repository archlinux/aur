# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-qasync-git
pkgver=v0.26.1.r0.gee9b0a3
pkgrel=1
pkgdesc="Python library for using asyncio in Qt-based applications (Git version)"
arch=(any)
url="https://github.com/CabbageDevelopment/qasync"
license=("BSD")

depends=("python")
makedepends=("git" "python-build" "python-installer")
optdepends=("python-pyqt5: PyQt5 support"
            "python-pyqt6: PyQt6 support"
            "pyside2: PySide2 support"
            "pyside6: PySide6 support")
provides=("python-qasync")
conflicts=("python-qasync")

source=("qasync::git+https://github.com/CabbageDevelopment/qasync.git")
sha512sums=("SKIP")

pkgver() {
    cd qasync
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd qasync
    python -m build --wheel --no-isolation
}

package() {
    cd qasync
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
