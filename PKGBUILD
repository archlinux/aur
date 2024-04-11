# Maintainer: Steffen Jaeckel <arch at jaeckel dot eu>

pkgname=subsurface-appimage
pkgver=6.0.5112
pkgrel=1
pkgdesc="The free, open-source cross-platform dive log software. (AppImage version)"
arch=('x86_64')
url='https://subsurface-divelog.org/'
license=('GPL2')
depends=('fuse2')
provides=("subsurface=${pkgver}")
conflicts=('subsurface' 'subsurface-git')
source=("https://subsurface-divelog.org/downloads/Subsurface-v${pkgver}-CICD-release.AppImage"
        'subsurface.sh')
sha256sums=('b935bd3b750df0c12a8c05827896486dda4786766f0e84bf8ffa36a2ca1bb28d'
            '7694ff6ba4a998e4924d0a0f10481bf1ab27b1af23ca5cce190d0d873f966d48')
options=(!strip !debug)
_image="$(basename "${source[0]}")"
_pkgbasename=subsurface

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_image}" "${pkgdir}/opt/appimages/${_pkgbasename}.AppImage"
  install -Dm755 "${srcdir}/${_pkgbasename}.sh" "${pkgdir}/usr/bin/${_pkgbasename}"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}

# vim:set ts=2 sw=2 et:
