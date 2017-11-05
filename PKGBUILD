# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Ali Ukani <ali.ukani@gmail.com>

pkgname=voltra
pkgver=3.1.4
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
makedepends=('chrpath')
provides=('voltra')
#changelog=https://docs.voltra.co/desktop/release.html
source=("https://s3.amazonaws.com/download.voltra.co/Voltra_${pkgver}_amd64.deb"
        'voltra.desktop'
        'COPYRIGHT')
md5sums=('0e27745efcbb2e2b0761cc9ef60043fd'
         'b2af85661a450915f4a91d0ba9f4a4f3'
         'bad5ffe34c28e007c0b76453082f59fd')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d ${pkgdir}/usr/bin
  ln -s /opt/Voltra/voltra ${pkgdir}/usr/bin/voltra
  chrpath --delete ${pkgdir}/opt/Voltra/resources/app.asar.unpacked/node_modules/taglib2/build/Release/taglib2.node

  install -D ${srcdir}/voltra.desktop ${pkgdir}/usr/share/applications/voltra.desktop
  install -D ${pkgdir}/usr/share/icons/hicolor/512x512/apps/voltra.png ${pkgdir}/usr/share/pixmaps/voltra.png
  rm -R ${pkgdir}/usr/share/icons

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  mv  ${pkgdir}/opt/Voltra/{LICENSE.electron.txt,LICENSES.chromium.html} ${pkgdir}/usr/share/licenses/${pkgname}/
  install -D ${srcdir}/COPYRIGHT ${pkgdir}/usr/share/licenses/${pkgname}/
}
