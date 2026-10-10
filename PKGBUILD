# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=photosuite-bin
pkgver=0.9.16
pkgrel=1
pkgdesc="A desktop image editor, faithful to classic Adobe Photoshop, with native PSD/PSB compatibility (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/eolix/photosuite"
license=('Apache-2.0')
depends=('gtk3' 'gdk-pixbuf2' 'shared-mime-info' 'openal' 'ftgl' 'openjpeg2' 'sqlite' 'curl' 'libsoup3')
options=('!strip' '!debug')
source=("photosuite.AppImage::https://github.com/eolix/photosuite/releases/download/v${pkgver}/PhotoSuite_${pkgver}_amd64.AppImage"
        "LICENSE-APACHE::https://raw.githubusercontent.com/eolix/photosuite/main/LICENSE-APACHE")
sha256sums=('SKIP'
            'SKIP')
prepare() {
  chmod +x "${srcdir}/photosuite.AppImage"
  "${srcdir}/photosuite.AppImage" --appimage-extract > /dev/null 2>&1
}
package() {
  cd "${srcdir}/squashfs-root"
  install -Dm755 usr/bin/photosuite "${pkgdir}/usr/bin/photosuite"
  install -Dm644 usr/share/applications/PhotoSuite.desktop "${pkgdir}/usr/share/applications/PhotoSuite.desktop"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/photosuite.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/photosuite.png"
  install -Dm644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
