pkgname=chat2db-pro-bin
_pkgname=Chat2DB-Pro
pkgver=5.3.0
pkgrel=1
pkgdesc="AI-driven database tool and SQL client (Pro, bundled JRE)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://chat2db.ai/"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'mesa'
    'at-spi2-core'
    'libxext'
    'libxi'
    'libxrandr'
    'libcups'
    'libxkbcommon'
    'nss'
    'nspr'
    'alsa-lib'
    'libxcomposite'
    'cairo'
    'pango'
    'libxdamage'
    'freetype2'
    'libxcursor'
)
options=(
    '!emptydirs'
    '!strip'
)
source=("${pkgname%-bin}.sh")
source_aarch64=(
    "${_pkgname}-arm64-latest.rpm::https://download.chat2db-ai.com/download/latest/${_pkgname}-arm64-latest.rpm"
)
source_x86_64=(
    "${_pkgname}-latest.rpm::https://download.chat2db-ai.com/download/latest/${_pkgname}-latest.rpm"
)
sha256sums=('c7fd231e89bcd574e01084173ce3f59b292ff08fcf6fe7ef272b2c2636cc5a03')
sha256sums_aarch64=('3d456049f7baddf37e74e80e2b39679374c9d63441e1e9c05017d4e7d68885a0')
sha256sums_x86_64=('a8ece8e1aabad533cbc197d7844b39643edb2eec920ac091a64ddd117f5684d8')

prepare() {
    sed -i \
        -e 's|^Exec=.*|Exec=chat2db-pro %U|' \
        -e 's|^Icon=.*|Icon=chat2db-pro|' \
        "${srcdir}/opt/chat2db-pro/chat2db-pro/lib/chat2db-pro-Chat2DB_Pro.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/chat2db-pro/chat2db-pro/." "${pkgdir}/usr/lib/${pkgname%-bin}/"

    install -Dm644 \
        "${srcdir}/opt/chat2db-pro/chat2db-pro/lib/chat2db-pro-Chat2DB_Pro.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 \
        "${srcdir}/opt/chat2db-pro/chat2db-pro/lib/Chat2DB Pro.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 \
        "${srcdir}/opt/chat2db-pro/chat2db-pro/lib/chat2db-pro-Chat2DB_Pro-MimeInfo.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
