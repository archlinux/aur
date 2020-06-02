# Maintainer: Radoslaw Mejer <radmen @ radmen.info>

pkgname=stoplight-studio-appimage
pkgver=1.12.0
pkgrel=2
pkgdesc="The modern editor for API Architects and Technical Writers."
arch=('x86_64')
url='https://stoplight.io/studio/'
license=('custom')
depends=('fuse2')
source=(
  "stoplight-studio-linux-x86_64-${pkgver}.AppImage::https://github.com/stoplightio/studio/releases/download/v${pkgver}/stoplight-studio-linux-x86_64.AppImage"
  "stoplight-studio.desktop"
)
sha256sums=(
  "9ad71937a51a39cd0aaf8e7bb2ec2491e2ab8ab4a26dcb7b4128b5409d6e1bfd"
  "5a45f03ec544bfdf2c75391a68d29302e7f721348ba530a8f365697c799f84a2"
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
