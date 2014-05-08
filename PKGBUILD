# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=kagbeta
pkgver=0.97
pkgrel=2
pkgdesc="King Arthur's Gold BETA is a game about building castles and destroying your enemies (inspired by Soldat and Minecraft)."
arch=('any')
url="http://kag2d.com/"
license=('custom')
if test "$CARCH" == x86_64; then
  depends=(desktop-file-utils xdg-utils lib32-libgl lib32-freetype2 lib32-libstdc++5 lib32-libpng15)
else
  depends=(desktop-file-utils xdg-utils libgl freetype2 libstdc++5 libpng15)
fi
install=kagbeta.install
source=(http://dl.kag2d.com/kagbeta-linux32-client.tar.gz
        kagbeta
        kagbeta.desktop
        irrlicht_1_32x32x24.png
        LICENSE)
md5sums=("2658f15ffebf811b2436a5ff2e5270ab"
         "1a980207740dec09a1522152ee4f6b65"
         "f23363aa7bd01f35f1a7641ff931afe2"
         "81f2bae53e67f9220802b1187b8f398f"
         "35cae9aeae1c2d561677230795d0d827")

package() {
  cd ${srcdir}/

  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/${pkgname}
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm755 kagbeta ${pkgdir}/usr/bin/kagbeta

  cp -r kagbeta-linux32-client/* ${pkgdir}/usr/share/${pkgname}
  find ${pkgdir}/usr/share/${pkgname} -type d -exec chmod 775 {} \;
  find ${pkgdir}/usr/share/${pkgname} -type f -exec chmod 664 {} \;
  chmod 774 ${pkgdir}/usr/share/${pkgname}/KAG
  chown -R root:games ${pkgdir}/usr/share/${pkgname}

  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
  desktop-file-install -m 644 --dir ${pkgdir}/usr/share/applications/ kagbeta.desktop
  install -m644 -D irrlicht_1_32x32x24.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/kagbeta.png
}

