pkgname=jddiff
pkgver=1.4
pkgrel=1
pkgdesc="A graphical cross platform diff viewer"
arch=("any")
url="https://codeberg.org/JakobDev/jdDiff"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6")
makedepends=("qt5-tools"  "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdDiff/archive/${pkgver}.tar.gz")
sha256sums=("658704c4db8c67ecdfa202dce71c8bafde5e136baaf620aa4007c317aa346c5f")

build() {
      cd "jddiff"
      python -m build --wheel --no-isolation
}

package() {
    cd "jddiff"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
