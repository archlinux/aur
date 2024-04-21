pkgname=jddbusdebugger
pkgver=3.0
pkgrel=1
pkgdesc="An advanced D-Bus Debugger"
arch=("any")
url="https://codeberg.org/JakobDev/jdDBusDebugger"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-jeepney")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdDBusDebugger/archive/${pkgver}.tar.gz")
sha256sums=("9a9a53e204ba87efdd7bbe257a3dd0584dc7ac94a2030c1fae2f58b225e611cd")

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
