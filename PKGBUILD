pkgname=jdminecraftlauncher
pkgver=6.1
pkgrel=1
pkgdesc="An classic styled Minecraft Launcher"
arch=("any")
url="https://codeberg.org/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python" "python-pyqt6" "python-pyqt6-webengine" "python-minecraft-launcher-lib" "python-requests")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("gamemode: Run Minecraft in gamemode" "python-feedparser: Use RSS feed for news tab" "flite: Minecraft voice narration")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMinecraftLauncher/archive/${pkgver}.tar.gz" "Distribution.toml")
sha256sums=("ef38f8428847792a5c3736596ad59213588ae3dab563da6a4012302017cd801c" "54a1d52ed414e33ce0a8ef7b6b2abb5fe9dfbd45bfdeea59d6b7f93366d3ad4e")

prepare() {
    install -Dm644 "Distribution.toml" -t "jdminecraftlauncher/jdMinecraftLauncher"
}

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
