# Maintainer: Yurin <liyulin.china@gmail.com>

pkgname=waywallen-bin
_pkgver=0.2.6
_commit=8427e71
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
sha256sums=('48051424dea5752e0f9f690ea5360c0fdfe03ac10cfa52cab190dd5c5fa8727c')

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
