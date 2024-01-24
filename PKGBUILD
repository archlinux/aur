pkgname=jdsimpleautostart
pkgver=1.4
pkgrel=2
pkgdesc="Edit autostart entries"
arch=("any")
url="https://codeberg.org/JakobDev/jdSimpleAutostart"
license=("GPL3")
depends=("python"  "python-pyqt6" "python-desktop-entry-lib")
makedepends=("qt5-tools"  "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSimpleAutostart/archive/${pkgver}.tar.gz")
sha256sums=("1ec85d5b203bcb3decf8221ff3ca91afacd4ec43deeb685fde3f35c910b6dee1")

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
