# Maintainer: Sardelli Tommaso <lacappannadelloziotom at gmail dot com>

pkgname=beekeeper-studio-appimage
pkgver=3.8.9
pkgrel=1
pkgdesc='Cross platform SQL editor and database management app for Windows, Linux, and Mac'
arch=('x86_64')
url='https://beekeeperstudio.io/'
license=('MIT')
provides=("beekeeper-studio=${pkgver}")
conflicts=('beekeeper-studio' 'beekeeper-studio-bin')
source=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/Beekeeper-Studio-${pkgver}.AppImage"
        beekeeper-studio.desktop.patch
        beekeeper-studio.sh)
sha256sums=('652b348cd0121ade6208db8155658769c1d457ae7c5d0dcf5e6c8be107098f12'
            'd268ce58d0c5d17345608be8c2582397eb3e069b81bd1aa02559326730d7e17f'
            '6ec287cbcfb138b5249ba9c539c67cd1dfe5343d334595872de0dfc82115df2a')
options=(!strip)

_filename=./Beekeeper-Studio-${pkgver}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  patch -Np0 < ./beekeeper-studio.desktop.patch
}


package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/beekeeper-studio.AppImage"
  install -Dm755 "${srcdir}/beekeeper-studio.sh" "${pkgdir}/usr/bin/beekeeper-studio"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/beekeeper-studio.desktop" "${pkgdir}/usr/share/applications/beekeeper-studio.desktop"
}

# vim:set ts=2 sw=2 et:
