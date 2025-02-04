# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdnbtexplorer
pkgver=2.3
pkgrel=1
pkgdesc="An Editor for Minecraft NBT files"
arch=("any")
url="https://codeberg.org/JakobDev/jdNBTExplorer"
license=("GPL3")
depends=("python" "python-pyqt6" "python-nbt" "python-setuptools")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdNBTExplorer/archive/${pkgver}.tar.gz")
sha256sums=("ccd82c374e2c983579097dcd37e9748731376b3f314e228c1a8d52d3c04d8b13")

build() {
      cd "jdnbtexplorer"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdnbtexplorer"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
