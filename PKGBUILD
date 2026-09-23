# Maintainer: Yurin <liyulin.china@gmail.com>

pkgname=waywallen-bin
_pkgver=0.4.1
_commit=7d61049
pkgver=${_pkgver}.${_commit}
pkgrel=1
pkgdesc="Wallpaper manager for Wayland (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/waywallen/waywallen"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme')
provides=('waywallen')
conflicts=('waywallen')
options=(!strip)

_appimage="waywallen-${_pkgver}-x86_64.AppImage"
_tag="v${_pkgver}"
source=("${_appimage}::https://github.com/waywallen/waywallen/releases/download/${_tag}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('9d5d693cd3688d3f0e1919294e746d9c8dc270ba1669c21ee21c3eb5bf0850e1')

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract >/dev/null
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/waywallen"

  install -Dm644 squashfs-root/usr/share/applications/org.waywallen.waywallen.desktop \
    "${pkgdir}/usr/share/applications/org.waywallen.waywallen.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/org.waywallen.waywallen.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.waywallen.waywallen.svg"
  install -Dm644 squashfs-root/usr/share/metainfo/org.waywallen.waywallen.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/org.waywallen.waywallen.metainfo.xml"
}
