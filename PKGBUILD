pkgname=jdsimpleautostart
pkgver=1.4
pkgrel=1
pkgdesc="Edit autostart entries"
arch=("any")
url="https://codeberg.org/JakobDev/jdSimpleAutostart"
license=("GPL3")
depends=("python"  "python-pyqt6" "python-desktop-entry-lib")
makedepends=("qt5-tools"  "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSimpleAutostart/archive/${pkgver}.tar.gz")
sha256sums=("6f346f8687b8c08ef3c801aff1dd1406e9a413be80e3f1cdb02fddf3b0d93cf1")

build() {
      cd "jdsimpleautostart"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdsimpleautostart"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
