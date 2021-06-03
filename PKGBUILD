# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: HRKo <ootaharuki99 at gmail.com>
pkgname=mathpix-snipping-tool
pkgver=03.00.0021
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
source=("${pkgname}-${pkgver}-${arch}.AppImage::https://download.mathpix.com/linux/Mathpix_Snipping_Tool-x86_64.latest.AppImage")
sha512sums=('704d6d3eb73b9b6615a18620d7f56e2ce8a9ec6a1bfb434225a7ccecfbf914b19226bb481f87c7cbfa380644b9e10f414e25223dcc08c791b2b60abc177218a8')


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
