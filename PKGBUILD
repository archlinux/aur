# Maintainer: David Williams <davewil1973@gmail.com>
pkgname=tidewave-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Coding agent for full-stack web app development"
arch=('x86_64')
url="https://tidewave.ai"
license=('Apache-2.0')
depends=('fuse2' 'zlib')
provides=('tidewave')
conflicts=('tidewave')
source=("tidewave-${pkgver}.AppImage::https://github.com/tidewave-ai/tidewave_app/releases/download/v${pkgver}/tidewave-app-amd64.AppImage"
        "tidewave.desktop"
        "tidewave.svg")
sha256sums=('665836a36a79a4cb512eae8fa4b5296ee2800019d89dfc3d7d687b3cf12a91f9'
            '85b9f83e6ae7f42de7bcfc6186c75d764482ca8fe68d5799b919d1840ce6cd94'
            'e564de08f393cdfd0aaa095f55e4a0d761d250b2210e5e9ac05e4a22119307b8')
options=('!strip')

prepare() {
    chmod +x "${srcdir}/tidewave-${pkgver}.AppImage"
}

package() {
    # Install the AppImage
    install -Dm755 "${srcdir}/tidewave-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/tidewave.AppImage"

    # Create a symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/tidewave.AppImage" "${pkgdir}/usr/bin/tidewave"

    # Install desktop entry
    install -Dm644 "${srcdir}/tidewave.desktop" \
        "${pkgdir}/usr/share/applications/tidewave.desktop"

    # Install icon
    install -Dm644 "${srcdir}/tidewave.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tidewave.svg"
}
