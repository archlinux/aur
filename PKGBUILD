# Maintainer: Ary Kleinerman <kleinerman at gmail dot com>
pkgname=zsa-wally-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Flash your ZSA Keyboard the EZ way"
arch=(x86_64)
url="https://github.com/zsa/wally"
license=(MIT)
depends=(libusb webkit2gtk gtk3)
source=("https://github.com/zsa/wally/releases/download/${pkgver}-linux/wally"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/zsa/wally/archive/refs/tags/${pkgver}-linux.tar.gz")
provides=()
conflicts=()
sha256sums=('a30c974c2fd544975e48f7f2ac99a21f936fa3e0803afeeb1096826a79afdbde'
            '6d0681a422055208bcfbcb20f44503df05e9e8cf66ba2ef7adec6e5fb8e634ee')

prepare() {
    chmod +x "${srcdir}/wally"
}

package() {
    install -Dm 755 "${srcdir}/wally" "${pkgdir}/usr/bin/wally"
    install -Dm 644 "${srcdir}/wally-${pkgver}-linux/dist/linux64/"*.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -Dm 644 "${srcdir}/wally-${pkgver}-linux/dist/linux64/"*.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm 644 "${srcdir}/wally-${pkgver}-linux/appicon.png" "${pkgdir}/usr/share/pixmaps/wally.png"
    install -Dm 644 "${srcdir}/wally-${pkgver}-linux/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
