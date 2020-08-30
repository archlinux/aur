# Maintainer: Nico <desoxhd@gmail.com>
# Maintainer: Harry Stanton <h@harry.city>
pkgname=lyrebird
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple and powerful voice changer for Linux, written in GTK 3"
arch=('any')
url="https://github.com/chxrlt/lyrebird"
license=('MIT')
depends=('python>=3.7' 'python-toml' 'gtk3' 'python-gobject' 'sox' 'libsoxr' 'pulseaudio')
conflicts=('lyrebird')
provides=('lyrebird')

source=("${url}/archive/v${pkgver}.tar.gz" "${pkgname}.desktop")
sha256sums=('479f225907dc3cffa4d31d40a892bb3363a6a03e22b78288dfed5c77db67ed1f' '720e247b83802fceef0100f722b2d48b81eb288739872278474b285d850c6e9c')

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
