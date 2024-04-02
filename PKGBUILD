pkgname=jdmacroplayer
pkgver=0.1
pkgrel=1
pkgdesc="Wayland compatible macro player for Linux"
arch=("any")
url="https://jakobdev.codeberg.page/work/app/jdMacroPlayer"
license=("GPL3")
depends=("python" "python-pyqt6" "polkit" "ydotool")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMacroPlayer/archive/${pkgver}.tar.gz")
sha256sums=("bb2937316ad0d605c6b96efc84f5d93f619ecd401c52c6c86215a132416d61c0")

build() {
      cd "jdmacroplayer"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdmacroplayer"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
