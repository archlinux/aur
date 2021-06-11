# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: HRKo <ootaharuki99 at gmail.com>
pkgname=mathpix-snipping-tool
pkgver=03.00.0025
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
options=(!strip
)
optdepends=('wayland: Wayland support.')
source=("${pkgname}-${pkgver}-${arch}.AppImage::https://download.mathpix.com/linux/Mathpix_Snipping_Tool-${arch}.v${pkgver}.AppImage")
sha512sums=('814bf8f91b06533de737ab2c5329505ec5e1bd9f372ee23c92a07f690db15705c169a039165d464e6c702149a4dfcef24382b6ed10ea20603c6ef22aeb220cdf')


prepare() {
  cd $srcdir
  chmod a+x ${pkgname}-${pkgver}-${arch}.AppImage
  ./${pkgname}-${pkgver}-${arch}.AppImage --appimage-extract
}

package() {
  cd $srcdir/squashfs-root
  install -Dm755 usr/bin/${pkgname}     ${pkgdir}/usr/bin/${pkgname}
#   install -Dm755 usr/lib/libasn1.so.8   ${pkgdir}/usr/lib/libasn1.so.8
  install -Dm755 usr/lib/libsentry.so   ${pkgdir}/usr/lib/libsentry.so 
#   install -Dm755 usr/plugins/position/libqtposition_serialnmea.so  ${pkgdir}/usr/lib/qt/plugins/position/libqtposition_serialnmea.so
  
  cp -r usr/share         ${pkgdir}/usr
  chmod 0755 -R ${pkgdir}/usr/share
  
  rm -rf ${pkgdir}/usr/share/doc
}
