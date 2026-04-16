pkgname=jdsimpleautostart
pkgver=1.6
pkgrel=1
pkgdesc="Edit autostart entries"
arch=("any")
url="https://codeberg.org/JakobDev/jdSimpleAutostart"
license=("GPL3")
depends=("python" "python-pyqt6" "python-desktop-entry-lib")
makedepends=("qt6-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdSimpleAutostart/archive/${pkgver}.tar.gz")
sha256sums=("93de2ef2449f3535d319acc4a1fa49063e9d01a4fecf39fc4b4d94952deebca1")

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
