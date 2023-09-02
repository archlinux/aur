# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=authpass-bin
pkgver=1.9.9_1977
pkgrel=1
pkgdesc='Password Manager based on Flutter for all platforms. Keepass 2.x (kdbx 3.x) compatible.'
arch=('x86_64')
url="https://authpass.app/"
_githuburl="https://github.com/authpass/authpass"
_downurl="https://data.authpass.app/data/artifacts"
license=('GPL3')
depends=('gtk3' 'libsecret' 'libkeybinder3' 'gcc-libs' 'cairo' 'gdk-pixbuf2' 'libepoxy' 'at-spi2-core' 'glibc' 'pango' 'glib2' 'fontconfig' 'harfbuzz')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/${pkgname%-bin}-linux-${pkgver}.deb")
sha256sums=('91816757def7919e67aef6a719453567306479a6864a86b269e5b5e78d09b102')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${pkgname%-bin}/icon.svg|${pkgname%-bin}|g;s|Network|Network;Utility|g" \
      -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm0644 "${srcdir}/opt/${pkgname%-bin}/icon.svg" "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}"
}