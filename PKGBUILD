# Maintainer: Lai Jiang <jianglai@msn.com>

pkgname=plezy-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="A beautiful Plex media server client built with Flutter"
arch=('x86_64')
url="https://github.com/edde746/plezy"
license=('GPL-3.0-or-later')
depends=('libkeybinder3' 'mpv')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/edde746/plezy/releases/download/${pkgver}/plezy-linux.tar.gz"
        "${pkgname%-bin}.desktop")
sha256sums=('7004ac457469ffe9c4db33742f815042cf21e8c9b8ef400143a091d4a7d88ba7'
            '8d0babb9ad5540b243be88957ed6ca92608ea80801728d0fe3252ba64de64693')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

package() {
    cd "${srcdir}"

    # Install main application
    install -dm755 "${pkgdir}/opt/${pkgname%-bin}"
    cp -r data lib plezy "${pkgdir}/opt/${pkgname%-bin}/"

    # Make executable
    chmod +x "${pkgdir}/opt/${pkgname%-bin}/plezy"

    # Create symlink for command-line access
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/plezy" "${pkgdir}/usr/bin/${pkgname%-bin}"

    # Install icons in multiple sizes
    for size in 1024x1024 512x512 256x256; do
        install -Dm644 "data/flutter_assets/assets/plezy.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname%-bin}.png"
    done

    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" \
        "${pkgdir}/usr/share/applications/com.edde746.plezy.desktop"
}
