pkgname=accomplish-appimage
_pkgname=Accomplish
pkgver=0.4.13
pkgrel=1
pkgdesc='Open source AI desktop agent repackaged from the upstream AppImage release'
arch=('x86_64')
url='https://github.com/accomplish-ai/accomplish'
license=('MIT')
depends=()
options=(!strip)
source=(
  "${_pkgname}-${pkgver}-linux-x86_64.AppImage::https://downloads.accomplish.ai/downloads/${pkgver}/linux/Accomplish-${pkgver}-linux-x86_64.AppImage"
  'accomplish.desktop'
  'LICENSE-MIT.txt'
  'accomplish.png::https://raw.githubusercontent.com/accomplish-ai/accomplish/main/apps/desktop/resources/icon.png'
)
sha256sums=('02afda17677790d37c192056bb9f6a15644ae2444ad346bff031e0dcaea4f1b6'
            '88049656bc62ce4edbd620f14f22bc28d9765f0dc29109c09d8c6d4ec2c74f8d'
            '931db2c39420be9c6b3fa63d4faa1d60fa75449550cdaa0e1d07f847f46c7cc2'
            '3e482265871c432bd2be56c2a20b9b9a5ca6062b3b37f8b1989464d6eb16fd97')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 \
    "${srcdir}/${_pkgname}-${pkgver}-linux-x86_64.AppImage" \
    "${pkgdir}/opt/${pkgname}/accomplish.AppImage"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/accomplish" <<'WRAPPER'
#!/bin/sh
exec /opt/accomplish-appimage/accomplish.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/accomplish"

  install -Dm644 "${srcdir}/accomplish.desktop" "${pkgdir}/usr/share/applications/accomplish.desktop"
  install -Dm644 "${srcdir}/accomplish.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/accomplish.png"
  install -Dm644 "${srcdir}/LICENSE-MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
