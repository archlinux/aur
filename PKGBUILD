# Maintainer: Thom Wiggers <thom@thomwiggers.nl>
# Contributors: M0Rf30 <morf3089@gmail.com>
# Contributors: hoban
# Contributors: Nrm
#
# This package can be found at https://github.com/thomwiggers/aur-subsonic-beta/

pkgname=subsonic-beta
pkgver=5.3.beta2
epoch=1 # 5.1.beta sorts higher than 5.1
pkgrel=3
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="http://subsonic.org/"
license=('GPL')
depends=('java-runtime-headless')
conflicts=('subsonic')
provides=('subsonic')
source=(http://prdownloads.sourceforge.net/subsonic/subsonic-${pkgver}-standalone.tar.gz      
	    'subsonic.service')
backup=('var/lib/subsonic/db'
        'var/lib/subsonic/subsonic.properties'
        'var/lib/subsonic/subsonic.sh')
install=$pkgname.install

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/subsonic
  mkdir -p $pkgdir/var/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/
  sed -i 's/SUBSONIC_HOME=\/var\/subsonic/SUBSONIC_HOME=\/var\/lib\/subsonic/' subsonic.sh
  cp  * $pkgdir/var/lib/subsonic
  rm $pkgdir/var/lib/subsonic/{subsonic.bat,subsonic-${pkgver}-standalone.tar.gz}
  ln -fs /var/lib/subsonic/subsonic.sh $pkgdir/etc/subsonic.conf
  cp $srcdir/subsonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/lib/subsonic/subsonic.sh
}

sha1sums=('e2d681ec860bdbe53e4f88c0f96f9a3019a89888'
          '71a3cb05a686e97423a7a5195ff05ad5f2a1cb30')
sha256sums=('7028b5f1a4ffb10614b5b4e8d187d38248a53033ae96594912b0698f1557f798'
            'f5404721615b6e1ce7b5212b41f8799bc8ed09c8a1a9c5de71e439da41d2c6aa')
sha512sums=('6bdd63691b83886781d2386e5153a2bf098b7b0b6f593206f2ccf76783450688e0bc96b71378dbc99473691b658e4c8b521ec77178ff12b8bbc0ae0ce7499819'
            '9026ea4e216f359146cf325083ddbf051d1d141bf6342ec750723ab891e5a212f55411ce8d0dd9697b8636541618220498fc8aa9b4c680a8d2c34ab7ee4db02e')
