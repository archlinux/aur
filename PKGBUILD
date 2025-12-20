# Maintainer: Aburady <accounts@aburady.com>

pkgname=plezy
pkgver=1.11.0
pkgrel=1
pkgdesc="A beautiful Plex media server client built with Flutter"
arch=('x86_64')
url="https://github.com/edde746/plezy"
license=('GPL-3.0-or-later')
depends=('libkeybinder3' 'mpv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/edde746/plezy/releases/download/${pkgver}/plezy-linux.tar.gz"
        "${pkgname}.desktop")
sha256sums=('bc5b061ac329bc02c22ddf129ae9288f248bb5e97c0c99c58924d63fb8b94899'
            '8d0babb9ad5540b243be88957ed6ca92608ea80801728d0fe3252ba64de64693')

package() {
    cd "${srcdir}"

    # Install main application
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r data lib plezy "${pkgdir}/opt/${pkgname}/"

    # Make executable
    chmod +x "${pkgdir}/opt/${pkgname}/plezy"

    # Create symlink for command-line access
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/plezy" "${pkgdir}/usr/bin/${pkgname}"

    # Install icons in multiple sizes
    for size in 1024x1024 512x512 256x256; do
        install -Dm644 "data/flutter_assets/assets/plezy.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done

    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
