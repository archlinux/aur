pkgname=jdminecraftlauncher
pkgver=7.0
pkgrel=1
pkgdesc="An classic styled Minecraft Launcher"
arch=("any")
url="https://codeberg.org/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python" "python-pyqt6" "python-pyqt6-webengine" "python-minecraft-launcher-lib" "python-requests" "python-jeepney")
makedepends=("qt6-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
optdepends=("gamemode: Run Minecraft in gamemode" "python-feedparser: Use RSS feed for news tab" "flite: Minecraft voice narration")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMinecraftLauncher/archive/${pkgver}.tar.gz" "Distribution.toml")
sha256sums=("f2f8383bab5538a86ffd629eb925f251868e23813db73dabee07bcb2ef546265" "54a1d52ed414e33ce0a8ef7b6b2abb5fe9dfbd45bfdeea59d6b7f93366d3ad4e")

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
