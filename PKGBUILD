# Maintainer: Nico <d3sox at protonmail dot com>
# Maintainer: Harry Stanton <harry@harrystanton.com>
pkgname=lyrebird
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple and powerful voice changer for Linux, written in Python and GTK"
arch=('any')
url="https://github.com/lyrebird-voice-changer/lyrebird"
license=('MIT')
depends=('python>=3.7' 'python-toml' 'gtk3' 'python-gobject' 'sox' 'libsoxr' 'pipewire-pulse')
conflicts=('lyrebird')
provides=('lyrebird')

source=("${url}/archive/v${pkgver}.tar.gz" "${pkgname}.desktop")
sha256sums=('d5fea39c34f4a554173e9bb576dcbb7680acf94cd1594033622cfd40b1f5f47d' '4469b6297dcdbfe49cc88d79dd7918d5850a36f7fce5b9f0969e36d209db0a7f')

package() {
    BIN_PATH="${pkgdir}/usr/bin"
    SHARE_PATH="${pkgdir}/usr/share/${pkgname}"
    DESKTOP_PATH="${pkgdir}/usr/share/applications"

    mkdir -p "${BIN_PATH}"
    mkdir -p "${SHARE_PATH}"
    mkdir -p "${DESKTOP_PATH}"

    install -Dm 644 "${pkgname}.desktop" "${DESKTOP_PATH}"

    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 755 "${pkgname}" "${BIN_PATH}/${pkgname}"

    cp -rf "app" "${SHARE_PATH}"

    install -Dm 644 "app.py" "${SHARE_PATH}"
    install -Dm 644 "icon.png" "${SHARE_PATH}"
}
