# Maintainer: Radoslaw Mejer <radmen @ radmen.info>

pkgname=stoplight-studio-appimage
pkgver=1.7.0
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
  "904e9671ae2aa0f349b9f8b3d2090c12e90d4036b85a9afecd56bbdef08e323b"
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
