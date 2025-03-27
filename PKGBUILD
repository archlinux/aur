pkgname=jdsimpleautostart
pkgver=1.5
pkgrel=1
pkgdesc="Edit autostart entries"
arch=("any")
url="https://codeberg.org/JakobDev/jdSimpleAutostart"
license=("GPL3")
depends=("python" "python-pyqt6" "python-desktop-entry-lib")
makedepends=("qt6-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSimpleAutostart/archive/${pkgver}.tar.gz")
sha256sums=("940dc58a7d54964125bfc91e104fc77f799a250b446a9ad7caecdd0793e40c21")

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
