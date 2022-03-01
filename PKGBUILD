# Maintainer: Remy Noel <mocramis@gmail.com>

pkgname=opengotha
pkgver=3.52.1
pkgrel=1
pkgdesc="Go game tournaments management program"
url="http://vannier.info/jeux/gotournaments/opengotha.htm"
arch=('any')
license=('GPLv2')
depends=(java-environment java-runtime)
source=(http://vannier.info/jeux/download/opengothaV$pkgver.zip 'opengotha.desktop' 'opengotha.sh')
sha256sums=('bd28f4796e3b4c8d342fd2ab87a878d4e1329eadf0c64967a54817fa49f60294'
            'ca3f2c97b846c3ae2fd1fbb5f9fbdff377738780f5bd2c7948666cb529098f62'
            '384ee5e54c3e4ee460a98b5308cb6ab13b44686b6fb29e9442f9bc9763c3e6be')
install=opengotha.install

package() {
  install -D ${srcdir}/opengotha.jar  ${pkgdir}/opt/${pkgname}/opengotha.jar

#TODO: Some of those copies could go in better places, but opengotha rely on those dirs
#      being in its main directory (sepecially save files.
#      This have the sad side-effects that it may los save files upon reinstall.
  cp -dr --no-preserve=ownership ${srcdir}/documents ${pkgdir}/opt/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/exportfiles ${pkgdir}/opt/${pkgname}/
  chmod 777 ${pkgdir}/opt/${pkgname}/exportfiles
  cp -dr --no-preserve=ownership ${srcdir}/gothahelp ${pkgdir}/opt/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/lib ${pkgdir}/opt/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/ratinglists ${pkgdir}/opt/${pkgname}/
  chmod 777 ${pkgdir}/opt/${pkgname}/ratinglists
  chmod a+w ${pkgdir}/opt/${pkgname}/ratinglists/*
  cp -dr --no-preserve=ownership ${srcdir}/resources ${pkgdir}/opt/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/tournamentfiles ${pkgdir}/opt/${pkgname}/
  chmod 777 ${pkgdir}/opt/${pkgname}/tournamentfiles
  chmod 777 ${pkgdir}/opt/${pkgname}/tournamentfiles/work
  cp -dr --no-preserve=ownership ${srcdir}/welcomesheet ${pkgdir}/opt/${pkgname}/


  install -D -m644 ${srcdir}/opengotha.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  install -D -m755 ${srcdir}/opengotha.sh ${pkgdir}/opt/${pkgname}/${pkgname}.sh
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/${pkgname}/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
}
