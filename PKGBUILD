# Maintainer: Thom Wiggers <thom@thomwiggers.nl>
# Contributors: M0Rf30 <morf3089@gmail.com>
# Contributors: hoban
# Contributors: Nrm
#
# This package can be found at https://github.com/thomwiggers/aur-subsonic-beta/

pkgname=subsonic-beta
pkgver=5.2.1
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

sha256sums=('523fa8357c961c1ae742a15f0ceaabdd41fcba9137c29d244957922af90ee791'
            'f5404721615b6e1ce7b5212b41f8799bc8ed09c8a1a9c5de71e439da41d2c6aa')
sha512sums=('1251b77cfbee80224d3e332945fecec981c79b27c129cb47f5880a82344db15d1f8d17b11dd272a4ad3d9794f4e3055d4a59826623d543b676de73fe1c83b936'
            '9026ea4e216f359146cf325083ddbf051d1d141bf6342ec750723ab891e5a212f55411ce8d0dd9697b8636541618220498fc8aa9b4c680a8d2c34ab7ee4db02e')
sha1sums=('d459650569a5a9013f76fc88da64919d71623d08'
          '71a3cb05a686e97423a7a5195ff05ad5f2a1cb30')
