pkgname=jdprocessfilewatcher
pkgver=1.1
pkgrel=1
pkgdesc="Effortlessly monitor and display real-time file access for any process"
arch=("any")
url="https://jakobdev.codeberg.page/work/app/jdAppStreamEdit"
license=("GPL3")
depends=("python"  "python-pyqt6" "python-desktop-entry-lib" "strace" "polkit")
makedepends=("qt5-tools"  "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdProcessFileWatcher/archive/${pkgver}.tar.gz")
sha256sums=("cd0a531cdbd756008456b9e03f438260dd8d203aec2bb8dc818224c84bd336e5")

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
