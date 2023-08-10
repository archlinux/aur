# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=authpass-bin
pkgver=1.9.9
_rev=1950
pkgrel=2
pkgdesc='Password Manager based on Flutter for all platforms. Keepass 2.x (kdbx 3.x) compatible.'
arch=('x86_64')
url="https://authpass.app/"
_githuburl="https://github.com/authpass/authpass"
_downurl="https://data.authpass.app/data/artifacts"
license=('GPL3')
depends=('gtk3' 'libsecret' 'libkeybinder3' 'gcc-libs' 'cairo' 'gdk-pixbuf2' 'libepoxy' 'at-spi2-core' 'glibc' 'pango' 'glib2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/${pkgname%-bin}-linux-${pkgver}_${_rev}.deb")
sha256sums=('a80ac234e19f35f6db4858579c963054f7b7ded64f7112478c178940e0d311ba')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm0644 "${pkgdir}/opt/${pkgname%-bin}/icon.svg" "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}"
    sed "s|/usr/bin/${pkgname%-bin}|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/icon.svg|${pkgname%-bin}|g;s|Network|Network;Utility|g" \
      -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}