# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=authpass-bin
pkgver=1.9.9
pkgrel=3
pkgdesc='Password Manager based on Flutter for all platforms. Keepass 2.x (kdbx 3.x) compatible.'
arch=('x86_64')
url="https://authpass.app/"
_ghurl="https://github.com/authpass/authpass"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libsecret'
    'libkeybinder3'
    'cairo'
    'gdk-pixbuf2'
    'libepoxy'
    'at-spi2-core'
    'pango'
    'fontconfig'
    'harfbuzz'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}_1977.deb"
)
sha256sums=('91816757def7919e67aef6a719453567306479a6864a86b269e5b5e78d09b102')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${pkgname%-bin}/icon.svg|${pkgname%-bin}|g;s|Network|Network;Utility|g" \
      -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm0644 "${srcdir}/opt/${pkgname%-bin}/icon.svg" "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}"
}