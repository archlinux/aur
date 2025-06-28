pkgname=jddbusdebugger
pkgver=4.2
pkgrel=1
pkgdesc="An advanced D-Bus Debugger"
arch=("any")
url="https://codeberg.org/JakobDev/jdDBusDebugger"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-jeepney" "xdg-desktop-portal" "hicolor-icon-theme")
makedepends=("qt6-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("socat: Debug over Network" "jdsystemmonitor: View process properties")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdDBusDebugger/archive/${pkgver}.tar.gz")
sha256sums=("8ca5f5b0a14dda31c65746c0474c80f01345fce11d812d6f8147cb75f8127830")

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
