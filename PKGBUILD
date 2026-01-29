# Maintainer: kofany <j@dabrowski.biz>
pkgname=terx-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Cross-platform SSH client with GPU-accelerated terminal rendering"
arch=('x86_64')
url="https://github.com/OutrageLabs/terX"
license=('custom:proprietary')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'gdk-pixbuf2'
    'cairo'
    'pango'
    'libsoup3'
    'openssl'
    'hicolor-icon-theme'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
    'gst-plugins-good: video/audio support'
)
provides=('terx')
conflicts=('terx')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/OutrageLabs/terX/releases/download/v${pkgver}/terX_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    # Extract deb
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Ensure binary is executable
    if [[ -f "${pkgdir}/usr/bin/terx" ]]; then
        chmod 755 "${pkgdir}/usr/bin/terx"
    elif [[ -f "${pkgdir}/usr/bin/ter-x" ]]; then
        chmod 755 "${pkgdir}/usr/bin/ter-x"
        ln -sf ter-x "${pkgdir}/usr/bin/terx"
    fi

    # Install license
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo "terX is proprietary software. See https://github.com/OutrageLabs/terX" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
