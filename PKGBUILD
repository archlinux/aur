# Maintainer: Clarence <xjh.azzbcc@gmail.com>

_pkgname=spiritfarer
pkgname="${_pkgname}"-appimage
pkgver=1.0
pkgrel=1
pkgdesc="Spiritfarer (AppImage version)"
arch=('x86_64')
url='https://www.linuxgame.cn/%e7%81%b5%e9%ad%82%e6%91%86%e6%b8%a1%e4%ba%ba-spiritfarer'
provides=("${_pkgname}=${pkgver}")
source=("${_pkgname}-${pkgver}.appimage::https://de.linuxgame.cn/%E7%81%B5%E9%AD%82%E6%91%86%E6%B8%A1%E4%BA%BA/Spiritfarer_32138b_amd64.appimage"
        'spiritfarer.sh')
sha256sums=('182e14e8bc64db4f505365ec5d88e1481ea7bcd0f4a8691b3a827c948e6e8b03'
            '237e093d8fc27a48d65e337a4bb56f17308f8b28271d173a4e8295b34385ecf3')
options=(!strip)

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgname}-${pkgver}.appimage"
  ./"${_pkgname}-${pkgver}.appimage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.appimage" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/support/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -Dm644 "${srcdir}/squashfs-root/Spiritfarer.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i 's|^Exec=start.sh|Exec=spiritfarer|' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i 's|^Icon=UnityPlayer|Icon=spiritfarer|' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
