pkgname=jdmacroplayer
pkgver=0.2
pkgrel=2
pkgdesc="Wayland compatible macro player for Linux"
arch=("any")
url="https://jakobdev.codeberg.page/work/app/jdMacroPlayer"
license=("GPL3")
depends=("python" "python-pyqt6" "python-jeepney" "polkit" "ydotool")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("python-setproctitle: Use correct process name")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMacroPlayer/archive/${pkgver}.tar.gz")
sha256sums=("0d626a00aae2ba284652d0231cf46cc90d1377af20e83d6066060e6330081619")

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
