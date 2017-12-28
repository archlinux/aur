# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Ali Ukani <ali.ukani@gmail.com>

pkgname=voltra
pkgver=3.4.0
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
        'COPYRIGHT'
        'voltra_EULA.html'
        'voltra_privacy_policy.html'
        'voltra_terms_of_services.html')
md5sums=('58a4ccc3f5a0abd4563b0eefb7b1d24f'
         '86625b67e901dd6556ea691b3ba466fb'
         'be9f4e3cbcb7495c9b670737406572e3'
         'bad5ffe34c28e007c0b76453082f59fd'
         '3f05edb0b98550ad1b2ae6450d8efcbf'
         '8c659d4fe8182ba17c0ac439b163a9ff'
         'd91f97b0d0dd198337296a6476646919')
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
  install -D ${srcdir}/*.html ${pkgdir}/usr/share/licenses/${pkgname}/
}
