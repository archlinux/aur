# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: HRKo <ootaharuki99 at gmail.com>
pkgname=mathpix-snipping-tool
pkgver=03.00.0074
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
sha512sums=('ecd555699f80ece9a21646142483392929c8058a9ffe01b969e5c91b40f90e625aaf20c1343615d865a0f5412eb10907c224ad925b38c26efeafdb4b039374b4')


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
