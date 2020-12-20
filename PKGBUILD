# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="snapidy"
pkgver=1.0.1
pkgrel=1
pkgdesc="Alternative web client for Snapcast"
url="https://github.com/djmattyg007/snapidy"
license=("GPL3" "MIT")
arch=("any")
makedepends=("zip")
source=(
    "https://github.com/djmattyg007/snapidy/releases/download/${pkgver}/snapidy-${pkgver}.zip"
    "config.example.json"
)
noextract=(
    "snapidy-${pkgver}.zip"
)
sha256sums=(
    "2648293374020eba11721e36cc6948eb50ad2de5158a3e7eadb0c6dc5fdc8d1f"
    "cef91057cd29a645a5fd7878b0845e77c192d028261837b6cb833f3963d8a07c"
)

package() {
    install -dm755 "${pkgdir}/usr/share/snapidy/dist"
    cd "${pkgdir}/usr/share/snapidy/dist"
    unzip "${srcdir}/snapidy-${pkgver}.zip"
    chmod -R u+rwX,go+rX "${pkgdir}/usr/share/snapidy/dist"

    install -dm755 "${pkgdir}/etc/webapps/snapidy"
    ln -s "../../../../etc/webapps/snapidy/config.json" "${pkgdir}/usr/share/snapidy/dist/config.json"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/snapidy/config.example.json"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/etc/webapps/snapidy/config.example.json"
}
