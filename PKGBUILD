# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flclash-bin
_pkgname=FlClash
pkgver=0.8.82
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta,simple and easy to use, open-source and ad-free."
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
  'libayatana-appindicator'
  'libkeybinder3'
)
makedepends=(
  'patchelf'
)
source=(
	"${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.rpm"
)
sha256sums=('5259d993b8bcb9bb3ff83e5764c055452cc67f494d8e39a3c07dec95681fe18e')
prepare() {
  sed -i -e "
    s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
    s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    5i\Categories=Network;
  " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}