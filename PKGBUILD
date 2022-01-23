# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=steam-fast-login
pkgver=1.0.3
pkgrel=5
pkgdesc="Login manager for Steam, allowing fast switching between accounts"
arch=("any")
license=("GPL3")
url="https://github.com/djmattyg007/SteamFastLogin"
depends=("python" "python-setuptools" "python-appdirs" "python-pyqt5" "python-keyring")
optdepends=("dbus-python: some keyring providers require this")
source=("https://github.com/djmattyg007/SteamFastLogin/archive/${pkgver}.tar.gz")
sha256sums=("17d89216622a2a9b35f4284e5a88cc15d3851b23db4432ecc832317e4ae46bd0")

package() {
    cd "SteamFastLogin-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/steam-fast-login/LICENSE.txt"
    install -Dm644 README.txt "${pkgdir}/usr/share/doc/steam-fast-login/README.txt"

    install -Dm644 steam-fast-login.desktop "${pkgdir}/usr/share/applications/steam-fast-login.desktop"
    for size in 16 32 48 64 128 256; do
        install -Dm644 steamfastlogin/icons/logo${size}.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/steam-fast-login.png"
    done
}
