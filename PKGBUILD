# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>

_pkgname=kdenlive
pkgname=kdenlive-appimage
pkgver=19.08.3
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework"
arch=('x86_64')
url="https://www.kdenlive.org"
license=('GPL')
provides=('kdenlive')
conflicts=('kdenlive')
source=("https://files.kde.org/${_pkgname}/release/${_pkgname}-${pkgver}-${arch}.appimage"
        ${_pkgname}.sh)
md5sums=('95d86f11ddd1a92adc44c97639303b72'
         '7dbb30d7d56e805a8845743c26b94130')
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
