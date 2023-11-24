pkgname=jdprocessfilewatcher
pkgver=1.0
pkgrel=2
pkgdesc="Effortlessly monitor and display real-time file access for any process"
arch=("any")
url="https://codeberg.org/JakobDev/jdProcessFileWatcher"
license=("GPL3")
depends=("python"  "python-pyqt6" "python-desktop-entry-lib" "strace" "polkit")
makedepends=("qt5-tools"  "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdProcessFileWatcher/archive/${pkgver}.tar.gz")
sha256sums=("b7483cc91ca8b4e0249de7d612929a2d68f794f4693118652899d02209a80c67")

build() {
      cd "jdprocessfilewatcher"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdprocessfilewatcher"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
