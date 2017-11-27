# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Ali Ukani <ali.ukani@gmail.com>

pkgname=voltra
pkgver=3.2.3
pkgrel=1
pkgdesc='Material design music player, based on Electron'
arch=('x86_64')
url='https://voltra.co'
license=('custom')
depends=('gtk2'
         'libxss'
         'gconf'
         'nss'
         'alsa-lib'
         'libxtst')
provides=('voltra')
#changelog=https://docs.voltra.co/desktop/release.html
source=("https://s3.amazonaws.com/download.voltra.co/Voltra-${pkgver}.tar.gz"
        'voltra.png'
        'voltra.desktop'
        'COPYRIGHT')
md5sums=('8a6b867c4c16f481f864b09c484e1c7f'
         '86625b67e901dd6556ea691b3ba466fb'
         'b2af85661a450915f4a91d0ba9f4a4f3'
         'bad5ffe34c28e007c0b76453082f59fd')
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/opt/Voltra
  cp -r ${srcdir}/Voltra-${pkgver}/* ${pkgdir}/opt/Voltra/
  install -d ${pkgdir}/usr/bin
  ln -s /opt/Voltra/voltra ${pkgdir}/usr/bin/voltra

  install -D ${srcdir}/voltra.desktop ${pkgdir}/usr/share/applications/voltra.desktop
  install -D ${srcdir}/voltra.png ${pkgdir}/usr/share/pixmaps/voltra.png

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  mv  ${pkgdir}/opt/Voltra/{LICENSE.electron.txt,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}/
  install -D ${srcdir}/COPYRIGHT ${pkgdir}/usr/share/licenses/${pkgname}/
}
