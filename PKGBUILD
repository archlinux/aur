# Maintainer: lynix <lynix47@gmail.com>

pkgname=linphone-desktop-appimage
pkgver=4.3.0.alpha.98
_pkgver=4.3.0-alpha.98+443b3592
pkgrel=1
pkgdesc="A free VoIP and video softphone based on the SIP protocol (AppImage version)"
arch=('x86_64')
url='https://www.linphone.org'
license=('GPL2')
depends=('fuse2')
provides=("linphone-desktop=${pkgver}")
conflicts=('linphone-desktop-all' 'linphone-desktop-git' 'linphone-desktop-all-git' 'linphone-git')
source=("https://www.linphone.org/snapshots/AppImages/Linphone-${_pkgver}.AppImage"
        'linphone.sh')
sha256sums=('867528fb7d8b5a9e31ea52cb50ef4f54ca60c5b7a396d6c372fa5e6d394742c3'
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
