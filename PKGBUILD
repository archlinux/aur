pkgname=jdminecraftlauncher
pkgver=5.2
pkgrel=1
pkgdesc="An classic styled Minecraft Launcher"
arch=("any")
url="https://codeberg.org/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python" "python-pyqt6" "python-pyqt6-webengine" "python-minecraft-launcher-lib" "python-requests")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("gamemode: Run Minecraft in gamemode")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMinecraftLauncher/archive/${pkgver}.tar.gz")
sha256sums=("81b84916ffeb42a2f41eeb5b0812bdf6f96ae08a5b300fd46c2a7e4a61d16c6d")

build() {
      cd "jdminecraftlauncher"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdminecraftlauncher"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
