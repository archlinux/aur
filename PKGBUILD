pkgname=jddbusdebugger
pkgver=4.0
pkgrel=1
pkgdesc="An advanced D-Bus Debugger"
arch=("any")
url="https://codeberg.org/JakobDev/jdDBusDebugger"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-jeepney")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("socat: Debug over Network")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdDBusDebugger/archive/${pkgver}.tar.gz")
sha256sums=("cdf4dcee91af6d05ada8596a05ede6c856e40148bfe27882c2f6d862089226f5")

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
