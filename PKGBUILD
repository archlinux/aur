# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdreplace
pkgver=4.3
pkgrel=1
pkgdesc="With jdReplace you can replace a text in all files of a directory"
arch=("any")
url="https://codeberg.org/JakobDev/jdReplace"
license=("GPL3")
depends=("python" "python-pyqt6")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdReplace/archive/${pkgver}.tar.gz")
sha256sums=("33710f484f556e4b3ecaffe1c75a0cc80ef48cd200e533e8b192bb79bb78fb65")

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
