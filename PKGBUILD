# Maintainer: Ash <xash at riseup d0t net>
pkgname=geartowns-bin
pkgver=0.0.11
pkgrel=1
pkgdesc='Fujitsu FM Towns emulator and debugger with an embedded MCP server (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/drhelius/Geartowns'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl3' 'libglvnd' 'hicolor-icon-theme')
provides=('geartowns')
conflicts=('geartowns')
source=("geartowns-${pkgver}.desktop::https://raw.githubusercontent.com/drhelius/Geartowns/${pkgver}/platforms/linux/debian/geartowns.desktop"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/drhelius/Geartowns/${pkgver}/LICENSE"
        "geartowns-${pkgver}.6::https://raw.githubusercontent.com/drhelius/Geartowns/${pkgver}/platforms/linux/debian/geartowns.6"
        "geartowns-${pkgver}.xml::https://raw.githubusercontent.com/drhelius/Geartowns/${pkgver}/platforms/linux/debian/geartowns.xml"
        "geartowns-${pkgver}.png::https://raw.githubusercontent.com/drhelius/Geartowns/${pkgver}/platforms/shared/desktop/icons/geartowns-256.png")
source_x86_64=("Geartowns-${pkgver}-desktop-ubuntu24.04-x64.zip::https://github.com/drhelius/Geartowns/releases/download/${pkgver}/Geartowns-${pkgver}-desktop-ubuntu24.04-x64.zip")
source_aarch64=("Geartowns-${pkgver}-desktop-ubuntu24.04-arm64.zip::https://github.com/drhelius/Geartowns/releases/download/${pkgver}/Geartowns-${pkgver}-desktop-ubuntu24.04-arm64.zip")
sha256sums=('443e70feb18ea6d8963376e3d62e803fde196731547fc096d790b7074b9632d1'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'aa26e6619445eb69f306d32b4c265c7002e650cb06cf2500f06ff777dffc4646'
            '3744e4effb4e60b1724e64940cccaa2836a81345cfe1be22525d0d1f33e5e8ee'
            'b6cdfb8b8d983b06c4eb7db9fc63df40de85770716653da65b6489765abcee2e')
sha256sums_x86_64=('321998868b05bf861dbca3e7508ab31eded53f3b709e2ccfde1f5d471d2913b6')
sha256sums_aarch64=('e2e357bd273969cf74f69522c4ea301f87d2c372cdb738ec8b2ec8efb765e118')

package() {
  install -Dm755 "${srcdir}/geartowns" "${pkgdir}/usr/lib/geartowns/geartowns"
  install -Dm644 "${srcdir}/gamecontrollerdb.txt" "${pkgdir}/usr/lib/geartowns/gamecontrollerdb.txt"
  cp -r "${srcdir}/mcp" "${srcdir}/shaders" "${pkgdir}/usr/lib/geartowns/"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/geartowns/geartowns "${pkgdir}/usr/bin/geartowns"

  install -Dm644 "${srcdir}/geartowns-${pkgver}.desktop" "${pkgdir}/usr/share/applications/geartowns.desktop"
  sed -i 's|/usr/games/geartowns|geartowns|g' "${pkgdir}/usr/share/applications/geartowns.desktop"
  install -Dm644 "${srcdir}/geartowns-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/geartowns.png"
  install -Dm644 "${srcdir}/geartowns-${pkgver}.xml" "${pkgdir}/usr/share/mime/packages/geartowns.xml"
  install -Dm644 "${srcdir}/geartowns-${pkgver}.6" "${pkgdir}/usr/share/man/man6/geartowns.6"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
