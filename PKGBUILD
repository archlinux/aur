# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=muffon
pkgname="${_pkgname}-bin"
pkgver=1.4.0
pkgrel=2
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=(MIT)
providers=(staniel359)
conflicts=("${_pkgname}-appimage")
depends=(java-runtime at-spi2-core nss gtk3 alsa-lib pango cairo libx11 libcups glibc libdrm expat libxfixes libxcb \
    libxdamage libxkbcommon libxrandr dbus hicolor-icon-theme glib2 nspr libxext gcc-libs libxcomposite mesa)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('9d06009dfe50fa2c0368d4543628152d4b2a6020cd66d27b43e4e3242416c938'
            '4985e8b12eb4ad2141288d641a74f147bd64f3373000e4011092c526b4cf0855')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's/Categories=Audio/Categories=AudioVideo/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}