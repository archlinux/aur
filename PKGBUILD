# Maintainer: Clarence <xjh.azzbcc@gmail.com>

_pkgname=cstrike
pkgname="${_pkgname}"-appimage
pkgver=1.6
pkgrel=1
pkgdesc="Counter Strike 1.6 (AppImage version)"
arch=('x86_64')
url='https://www.linuxgame.cn/%e5%8f%8d%e6%81%90%e7%b2%be%e8%8b%b1'
provides=("${_pkgname}=${pkgver}")
source=("${_pkgname}-${pkgver}.appimage::https://de.linuxgame.cn/%E5%8F%8D%E6%81%90%E7%B2%BE%E8%8B%B1/${_pkgname}_${pkgver}_i386.appimage"
        'cstrike.sh')
sha256sums=('c2c3cc43e23dfd6c2816b9d110c09d7b9fea4b114ecfeb09515c189b7bc09b2d'
            '94991fe0fc983cfaf9d46f28d5a5498b6f74a02f4ee5800db0a5e7015f9b7109')
options=(!strip)

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgname}-${pkgver}.appimage"
  ./"${_pkgname}-${pkgver}.appimage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.appimage" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -Dm644 "${srcdir}/squashfs-root/7daystodie.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i 's|^Exec=cs|Exec=cstrike|' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
