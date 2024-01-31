pkgname=jddbusdebugger
pkgver=2.0
pkgrel=1
pkgdesc="An advanced D-Bus Debugger"
arch=("any")
url="https://codeberg.org/JakobDev/jdDBusDebugger"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdDBusDebugger/archive/${pkgver}.tar.gz")
sha256sums=("a908cd1ff18e14b35c18262e7573bf6fa495e83fe065fef4d0749e2057d0d03f")

build() {
      cd "jddbusdebugger"
      python -m build --wheel --no-isolation
}

package() {
    cd "jddbusdebugger"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
