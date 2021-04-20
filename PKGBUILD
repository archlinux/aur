# Maintainer: Marek "foxie" Brenčič <marek@brencic.sk>
# Contributor: Radoslaw Mejer <radmen @ radmen.info>

pkgname=stoplight-studio-appimage
pkgver=2.3.0
_realver=2.3.0-stable.5666.git-aa6309c
pkgrel=4
pkgdesc="The modern editor for API Architects and Technical Writers."
arch=('x86_64')
url='https://stoplight.io/studio/'
license=('custom')
depends=('fuse2')
source=(
  "stoplight-studio-linux-x86_64-${_realver}.AppImage::https://github.com/stoplightio/studio/releases/download/v${_realver}/stoplight-studio-linux-x86_64.AppImage"
  "stoplight-studio.desktop"
)
sha512sums=(
  "6ea36be7cf85b54324b5f0ee3ed7f4be5bad22a49200175f9d0743ebc2585b8cde1a27e780ee88f97cbd1ffac4fdea047299dc39860ecafc266593203e44805f"
  "0c7c3742debb40ed5a3323467441890e900d4416ddc10e2778ddadd930b7b9f0447978c446b4b80fd5c6ee29f4ca65054e0b8ccf59cd1780a95c044867ec54af"
)
options=(!strip)
_filename="./stoplight-studio-linux-${arch}-${_realver}.AppImage"

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
