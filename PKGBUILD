# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Christopher Cassidy <chris@bytcrft.net>
# Contributor: Kirill "reflexing" Churin <reflexing@reflexing.ru>
# Contributor: Kyrylo Silin <kyrylosilin@gmail.com>

pkgname=kag
pkgver=0.91A
pkgrel=2
pkgdesc="King Arthur's Gold Classic is a game about building castles and destroying your enemies (inspired by Soldat and Minecraft)"
arch=('any')
url="http://kag2d.com/"
license=('custom')
conflicts=('kag')
if test "$CARCH" == x86_64; then
  depends=(desktop-file-utils xdg-utils lib32-libgl lib32-freetype2 lib32-libstdc++5 lib32-libpng15)
else
  depends=(desktop-file-utils xdg-utils libgl freetype2 libstdc++5 libpng15)
fi
install=kag.install
source=(http://dl.kag2d.com/kag-linux32-latest.tar.gz
        kag
        kag.desktop
        irrlicht_1_32x32x24.png
        LICENSE)
md5sums=('097a49c01c162ff1edb7ffef9dc5d06a'
         '4b26f563e978acee99d4fe91e28b368c'
         '3d3b3ea71998582cc88269d3f2da4863'
         '81f2bae53e67f9220802b1187b8f398f'
         '35cae9aeae1c2d561677230795d0d827')

package() {
  cd ${srcdir}/

  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/${pkgname}
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}

  install -Dm755 kag ${pkgdir}/usr/bin/kag

  cp -r kag-linux32/* ${pkgdir}/usr/share/${pkgname}
  find ${pkgdir}/usr/share/${pkgname} -type d -exec chmod 755 {} \;
  find ${pkgdir}/usr/share/${pkgname} -type f -exec chmod 664 {} \;
  chmod 774 ${pkgdir}/usr/share/${pkgname}/KAG
  chown -R root:games ${pkgdir}/usr/share/${pkgname}

  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}

  # Proper installation of .desktop file
  desktop-file-install -m 644 --dir ${pkgdir}/usr/share/applications/ kag.desktop

  # Install icon (got from source package with "icotool -x irrlicht.ico")
  install -m644 -D irrlicht_1_32x32x24.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/kag.png
}

