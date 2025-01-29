pkgname=jdprocessfilewatcher
pkgver=2.0
pkgrel=1
pkgdesc="Effortlessly monitor and display real-time file access for any process"
arch=("any")
url="https://jakobdev.codeberg.page/work/app/jdProcessFileWatcher"
license=("GPL3")
depends=("python"  "python-pyqt6" "python-desktop-entry-lib" "strace" "polkit")
makedepends=("qt5-tools"  "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdProcessFileWatcher/archive/${pkgver}.tar.gz")
sha256sums=("cdf7fb49b35f2ec308dc0e4817d9861e70c6740b6e159706601cf4fe5c559f8e")

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
