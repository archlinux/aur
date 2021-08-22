# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: HRKo <ootaharuki99 at gmail.com>
pkgname=mathpix-snipping-tool
pkgver=03.00.0050
# _snapver=195
pkgrel=1
pkgdesc="Mathpix Snipping Tool"
arch=('x86_64')
url="https://mathpix.com/"
license=('unknown')
depends=('qt5-x11extras' 'qt5-webengine' 'qt5-svg' 'qt5-imageformats' 
#         'libxtst' 'libxrender' 'libxrandr' 'libxkbcommon'   'libxi' 'libxinerama'   'libxfixes' 'libxext'   
#         'libsasl'
)
options=(!strip)
optdepends=('wayland: Wayland support.')
source=("${pkgname}-${pkgver}-${arch}.AppImage::https://download.mathpix.com/linux/Mathpix_Snipping_Tool-${arch}.v${pkgver}.AppImage")
sha512sums=('cc418ae60f74774987362e6fcc7d80865f6cccc2fe51d3cb9d3ee6ac8a44f65e4140a8aea2862522a7d41fb2ee8e854554b9141bd514751712d20c4f239b82ab')


prepare() {
  cd $srcdir
  chmod a+x ${pkgname}-${pkgver}-${arch}.AppImage
  ./${pkgname}-${pkgver}-${arch}.AppImage --appimage-extract
}

package() {
  cd $srcdir/squashfs-root
  install -Dm755 usr/bin/${pkgname}     ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 usr/lib/libsentry.so   ${pkgdir}/usr/lib/libsentry.so 
#   install -Dm755 usr/plugins/position/libqtposition_serialnmea.so  ${pkgdir}/usr/lib/qt/plugins/position/libqtposition_serialnmea.so
  
  cp -r usr/share         ${pkgdir}/usr
  chmod 0755 -R ${pkgdir}/usr/share
  
  rm -rf ${pkgdir}/usr/share/doc
}
