# Maintainer: Radoslaw Mejer <radmen @ radmen.info>

pkgname=stoplight-studio-appimage
pkgver=1.7.2
pkgrel=1
pkgdesc="The modern editor for API Architects and Technical Writers."
arch=('x86_64')
url='https://stoplight.io/studio/'
license=('custom')
source=(
  "stoplight-studio-linux-x86_64-${pkgver}.AppImage::https://github.com/stoplightio/studio/releases/download/v${pkgver}/stoplight-studio-linux-x86_64.AppImage"
  "stoplight-studio.desktop"
)
sha256sums=(
  "1b4ccfbc5e7c280fbc8cb609cc3ea8148f96d3b5b88f820f0fae00853ecdc7ac"
  "SKIP"
)
options=(!strip)
_filename="./stoplight-studio-linux-${arch}-${pkgver}.AppImage"

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/stoplight-studio.AppImage"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/stoplight-studio.desktop" "${pkgdir}/usr/share/applications/stoplight-studio.desktop"
}
