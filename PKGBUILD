# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=gravit-designer-bin
pkgver=3.2.5
pkgrel=1
pkgdesc="A cross-platform, free design tool for the 21st century empowering everyone to design"
arch=('x86_64')
url="https://designer.io/"
license=('unknow')
depends=('alsa-lib'
         'libxss'
         'gtk2'
         'gconf'
         'libxtst'
         'nss')
source=("https://designer.gravit.io/_downloads/linux/GravitDesigner.zip"
        "gravitdesigner.desktop")
#changelog=https://discuss.gravit.io/t/changelog-for-gravit-designer/71
md5sums=('b2f9ca124af0794b6416c47b5faff0aa'
         '377dce4a55e955ffd58e67731a82c745')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf GravitDesigner.AppImage -C ${srcdir}/

  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/usr/bin/* ${pkgdir}/opt/${pkgname}/

  install -d ${pkgdir}/usr/share/applications/
  install -D ${srcdir}/gravitdesigner.desktop ${pkgdir}/usr/share/applications/gravitdesigner.desktop
  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/gravit-designer ${pkgdir}/usr/bin/gravit-designer
  chown root:root -R ${pkgdir}/

  install -D ${srcdir}/usr/share/icons/default/64x64/apps/gravit-designer.png ${pkgdir}/usr/share/pixmaps/gravit-designer.png

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  mv  ${pkgdir}/opt/${pkgname}/{LICENSE.electron.txt,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}/
}
