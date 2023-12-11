# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Emilio Reggi <nag@mailbox.org>
pkgname=postsack-bin
pkgver=1.0.2
pkgrel=4
pkgdesc="Visually cluster your emails by sender, domain, and more to identify waste"
arch=('x86_64')
url="https://github.com/terhechte/postsack"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
   'hicolor-icon-theme'
   'libxcb'
)
source=(
   "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver//.2/.0}_amd64.deb"
   "LICENSE-${pkgver}::https://raw.githubusercontent.com/terhechte/postsack/v${pkgver}/LICENSE.md"
)
sha256sums=('c35704da2d6ae3bb6f99b84b37abf40bfa7ec5e4de7e404e62ef5774bfd7d984'
            '27a8dc9b024005e4298e225801161df5db47f2ad5f82b03560a3584370c35d61')
build() {
   bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
   install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
   install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
   done
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}