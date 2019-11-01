# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>

_pkgname=krita
pkgname=${_pkgname}-appimage
pkgver=4.2.7.1
pkgrel=1
pkgdesc="Edit and paint images"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
source=("https://download.kde.org/stable/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}b-${arch}.appimage"
        ${_pkgname}.sh)
md5sums=('638f28d7278012b7d882b93154e005d0'
         'b4f6a06058b5cc4be425e05fc457bde2')
options=(!strip)
_filename=./${_pkgname}-${pkgver}b-${arch}.appimage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  rm ${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/org.kde.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
