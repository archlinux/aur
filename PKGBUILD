# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="muffon-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=(MIT)
providers=(staniel359)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=(java-runtime at-spi2-core nss gtk3 alsa-lib pango cairo libx11 libcups glibc libdrm expat libxfixes libxcb \
    libxdamage libxkbcommon libxrandr dbus hicolor-icon-theme glib2 nspr libxext gcc-libs libxcomposite mesa)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('0f503193a62f82ffd84e2a8b11940d883ebc57ede5745cd1969a0223d5b510b6'
            '6d1a22f787896797e8e8d5e0afd14121b67041b13d59965344c1b499fab6e8f8')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's|Audio|AudioVideo|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
