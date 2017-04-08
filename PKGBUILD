# Maintainer: Remy Noel <mocramis@gmail.com>

pkgname=opengotha
pkgver=3.44
pkgrel=2
pkgdesc="Go game tournaments management program"
url="http://vannier.info/jeux/gotournaments/opengotha.htm"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=(java-environment java-runtime)
source=(http://vannier.info/jeux/download/opengothaV$pkgver.zip 'opengotha.desktop' 'opengotha.sh')
sha256sums=('32b284722a14441e0dbf7251da6fa3a6487ea883024c0c59352b154548d92582'
            'dd257f51c6902cd514f36ceaa771560fc2fe4e1268d0fc0ba5fdb94cdea4d58d'
            'f691a050dd5ecc5a23dc49580aec699b6bc48c62675b69ba8051b489287f7121')

package() {
  install -D ${srcdir}/opengotha.jar  ${pkgdir}/usr/local/${pkgname}/opengotha.jar

#TODO: Some of those copies could go in better places, but opengotha rely on those dirs
#      being in its main directory.
  cp -dr --no-preserve=ownership ${srcdir}/documents ${pkgdir}/usr/local/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/exportfiles ${pkgdir}/usr/local/${pkgname}/
  chmod 777 ${pkgdir}/usr/local/${pkgname}/exportfiles
  cp -dr --no-preserve=ownership ${srcdir}/gothahelp ${pkgdir}/usr/local/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/lib ${pkgdir}/usr/local/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/ratinglists ${pkgdir}/usr/local/${pkgname}/
  chmod 777 ${pkgdir}/usr/local/${pkgname}/ratinglists
  chmod a+w ${pkgdir}/usr/local/${pkgname}/ratinglists/*
  cp -dr --no-preserve=ownership ${srcdir}/resources ${pkgdir}/usr/local/${pkgname}/
  cp -dr --no-preserve=ownership ${srcdir}/tournamentfiles ${pkgdir}/usr/local/${pkgname}/
  chmod 777 ${pkgdir}/usr/local/${pkgname}/tournamentfiles
  chmod 777 ${pkgdir}/usr/local/${pkgname}/tournamentfiles/copies
  cp -dr --no-preserve=ownership ${srcdir}/welcomesheet ${pkgdir}/usr/local/${pkgname}/

  install -D -m644 ${srcdir}/opengotha.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  install -D -m755 ${srcdir}/opengotha.sh ${pkgdir}/usr/local/${pkgname}/${pkgname}.sh
  mkdir -p $pkgdir/usr/local/bin
  ln -s /usr/local/${pkgname}/${pkgname}.sh $pkgdir/usr/local/bin/${pkgname}
}
