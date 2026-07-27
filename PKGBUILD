# Maintainer: Mathijs Verhaegh <mathijs@verhaegh.nl>

pkgname=openscad-snapshot-appimage
pkgver=2026.07.26
pkgrel=1
pkgdesc="The Programmers Solid 3D CAD Modeller (Snapshot AppImage version)"
arch=('x86_64')
url="https://www.openscad.org/"
license=('GPL2')
depends=('fuse2' 'shared-mime-info')
provides=('openscad')
conflicts=('openscad')
options=(!strip)

source=(
  "OpenSCAD-${pkgver}-x86_64.AppImage::https://files.openscad.org/snapshots/OpenSCAD-${pkgver}-x86_64.AppImage"
  "openscad.desktop"
  "openscad.png::https://openscad.org/assets/img/logo.png"
)
sha256sums=(
  '570a39a199b443c2072312db458a405e18efe51d4c83756e76048ea1069d946c'
  '0054ea531181266a881fec9ee6b976e7165a404081cd048509621aa1b05403c8'
  '9839be1ae8e9203798713b2d0377d265354f4c5d70fc457c3ff6f015e0e5f56d'
)

prepare() {
  chmod +x "OpenSCAD-${pkgver}-x86_64.AppImage"
  "./OpenSCAD-${pkgver}-x86_64.AppImage" --appimage-extract usr/share/mime/packages/openscad.xml
}

package() {
  install -Dm755 "OpenSCAD-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/openscad.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/openscad.AppImage" "${pkgdir}/usr/bin/openscad"
  install -Dm644 "${srcdir}/openscad.desktop" "${pkgdir}/usr/share/applications/openscad.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/openscad.xml" "${pkgdir}/usr/share/mime/packages/openscad.xml"
  install -Dm644 "${srcdir}/openscad.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openscad.png"
}

