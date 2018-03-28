# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=gravit-designer-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="A cross-platform, free design tool for the 21st century empowering everyone to design"
arch=('x86_64')
url="https://designer.io/"
license=('custom:freeware')
depends=('alsa-lib' 'libxss' 'gtk2' 'gconf' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.zip::https://designer.gravit.io/_downloads/linux/GravitDesigner.zip?v=${pkgver}"
        "gravit-designer.desktop"
        "gravit-designer.png"
        "LICENSE")
#changelog=https://discuss.gravit.io/t/changelog-for-gravit-designer/71
md5sums=('a17873bd75775ceb408b146a47af40af'
         '689ceb636418b52236edd98207fb9387'
         'a9c256cb9eb6bc9a280c5dccee2ad9af'
         '021ccafc0993d3c34265ae59048d4bf2')
PKGEXT='.pkg.tar'

package() {
  chmod +x GravitDesigner.AppImage
  ./GravitDesigner.AppImage --appimage-extract
  install -d ${pkgdir}/opt/${pkgname}
  cp -r --no-preserve=all ${srcdir}/squashfs-root/app/* ${pkgdir}/opt/${pkgname}/
  chmod +x ${pkgdir}/opt/${pkgname}/gravit-designer
  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/gravit-designer ${pkgdir}/usr/bin/gravit-designer

  install -D ${srcdir}/gravit-designer.desktop ${pkgdir}/usr/share/applications/gravitdesigner.desktop
  install -D ${srcdir}/gravit-designer.png ${pkgdir}/usr/share/pixmaps/gravit-designer.png
  install -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mv  ${pkgdir}/opt/${pkgname}/{LICENSE.electron.txt,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}/
}
