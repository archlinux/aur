# Maintainer: lynix <lynix47@gmail.com>

pkgname=linphone-desktop-appimage
pkgver=5.2.0
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
sha256sums=('5c11f5b0ca6badc7a5bd134a73df25f2f7ed5e0115ddfb735da5cee0c566bac5'
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
