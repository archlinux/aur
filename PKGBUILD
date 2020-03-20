# Maintainer: thegala <thegala at disroot dot org>
pkgname=icestudio-appimage
pkgver=0.5.0
pkgrel=1
pkgdesc="A real gamechanger in the world of Open Source FPGAs"
arch=('x86_64')
url='https://icestudio.io/'
license=('GPL2')
depends=('python')
provides=("icestudio")
conflicts=('icestudio')
source=("https://github.com/FPGAwars/icestudio/releases/download/v0.5.0/icestudio-0.5.0-linux64.AppImage"
        "icestudio.sh")
sha256sums=('SKIP' 'SKIP')
options=(!strip)
_filename=./icestudio-${pkgver}-linux64.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract > /dev/null 2>&1 &
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/icestudio.AppImage"
  install -Dm755 "${srcdir}/icestudio.sh" "${pkgdir}/usr/bin/icestudio"

  install -Dm644 "${srcdir}/squashfs-root/Icestudio.desktop" "${pkgdir}/usr/share/applications/icestudio.desktop"
}

# vim:set ts=2 sw=2 et:
