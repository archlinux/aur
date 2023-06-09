# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdreplace
pkgver=4.1
pkgrel=1
pkgdesc="With jdReplace you can replace a text in all files of a directory"
arch=("any")
url="https://codeberg.org/JakobDev/jdReplace"
license=("GPL3")
depends=("python" "python-pyqt6")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdReplace/archive/${pkgver}.tar.gz")
sha256sums=("53e8057adce3e95c2721af486d4ac8ed1e4a51d2372fdd4c39dff1b91b8465be")

build() {
      cd "jdreplace"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdreplace"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
