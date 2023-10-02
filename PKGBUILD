# Maintainer: Sardelli Tommaso <lacappannadelloziotom at gmail dot com>

pkgname=beekeeper-studio-appimage
pkgver=4.0.3
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
sha256sums=('3f61e509bd1d6a2e1c26529c4fd2cb43e9e35620fea074b7288d98751e63478e'
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
