# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: c3rt1fiedd <aur.c3rt@gmail.com>
# Contributor: lynix <lynix47@gmail.com>

pkgname=linphone-desktop-appimage
pkgver=6.2.3
pkgrel=1
pkgdesc="A free VoIP and video softphone based on the SIP protocol (AppImage version)"
arch=('x86_64')
url='https://www.linphone.org'
license=('GPL-3.0-or-later')
depends=('fuse2')
provides=("linphone-desktop=${pkgver}" "linphone=${pkgver}")
conflicts=('linphone-desktop-all' 'linphone-desktop-git' 'linphone-desktop-all-git' 'linphone-git')
source=("https://download.linphone.org/releases/linux/app/Linphone-${pkgver}-x86_64.AppImage"
        'linphone.sh')
sha256sums=('59f51be46a6eb75802239239a3628d0bcb53ddac0c22c78ae968bafca922aa0b'
            '1238a372faa4d6de8569b508c95ac39b7d21d3619660740b3ac4306642076bd2')
options=(!strip !debug)
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
