pkgname=jdsimpleautostart
pkgver=1.3
pkgrel=1
pkgdesc="Edit autostart entries"
arch=("any")
url="https://codeberg.org/JakobDev/jdSimpleAutostart"
license=("GPL3")
depends=("python"  "python-pyqt6" "python-desktop-entry-lib")
makedepends=("qt5-tools"  "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSimpleAutostart/archive/${pkgver}.tar.gz")
sha256sums=("a4877c8ba05bf14e2dbd4b9c6b38acff6b75d6b6f2f01c05178ce65d50822d77")

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
