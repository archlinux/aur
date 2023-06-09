pkgname=jdminecraftlauncher
pkgver=5.0
pkgrel=1
pkgdesc="An classic styled Minecraft Launcher"
arch=("any")
url="https://codeberg.org/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python" "python-pyqt6" "python-pyqt6-webengine" "python-minecraft-launcher-lib" "python-requests")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("gamemode: Run Minecraft in gamemode")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMinecraftLauncher/archive/${pkgver}.tar.gz")
sha256sums=("41ee52c85ce45c79683da0864352c9c09d141d78742420cb8731b65f1c653fa2")

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
