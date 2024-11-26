# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdnbtexplorer
pkgver=2.2
pkgrel=1
pkgdesc="An Editor for Minecraft NBT files"
arch=("any")
url="https://codeberg.org/JakobDev/jdNBTExplorer"
license=("GPL3")
depends=("python" "python-pyqt6" "python-nbt" "python-setuptools")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdNBTExplorer/archive/${pkgver}.tar.gz")
sha256sums=("33026cdc823df6e612acf95272d9762c2a2891ce8b6ee9e27bc90e62590c575b")

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
