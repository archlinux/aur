#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=kdenlive
pkgname=kdenlive-appimage
pkgver=21.12.1
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework"
arch=('x86_64')
#url="https://www.kdenlive.org"
license=('GPL')
provides=('kdenlive')
conflicts=('kdenlive')
source=("https://download.kde.org/stable/kdenlive/21.12/linux/${_pkgname}-${pkgver}-${arch}.appimage"
        ${_pkgname}.sh)
md5sums=('11a5ac0c0d68d5c68292c640c02e2394'
         '9f6bcd19b67bd5efaf25ea902301968d')
options=(!strip)
_filename=./${_pkgname}-${pkgver}-${arch}.appimage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  rm ${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/applications" "${pkgdir}/usr/share/"
  }
