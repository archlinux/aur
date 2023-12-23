# Maintainer: lynix <lynix47@gmail.com>

pkgname=linphone-desktop-appimage
pkgver=5.1.2
pkgrel=2
pkgdesc="A free VoIP and video softphone based on the SIP protocol (AppImage version)"
arch=('x86_64')
url='https://www.linphone.org'
license=('GPL2')
depends=('fuse2')
provides=("linphone-desktop=${pkgver}" "linphone=${pkgver}")
conflicts=('linphone-desktop-all' 'linphone-desktop-git' 'linphone-desktop-all-git' 'linphone-git')
source=("https://download.linphone.org/releases/linux/app/Linphone-${pkgver}.AppImage"
        'linphone.sh')
sha256sums=('06642063e64e9b6204b92d8ba36567423cd803ade00b3921075ebd4a22b4eaad'
            '1238a372faa4d6de8569b508c95ac39b7d21d3619660740b3ac4306642076bd2')
options=(!strip)
_image="$(basename "${source[0]}")"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/appimages/linphone.AppImage"
  install -Dm755 "${srcdir}/linphone.sh" "${pkgdir}/usr/bin/linphone"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/linphone.desktop" "${pkgdir}/usr/share/applications/linphone.desktop"
}

# vim:set ts=2 sw=2 et:
