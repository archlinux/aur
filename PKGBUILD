# Maintainer: Thom Wiggers <thom@thomwiggers.nl>
# Contributors: M0Rf30 <morf3089@gmail.com>
# Contributors: hoban
# Contributors: Nrm
#
# This package can be found at https://github.com/thomwiggers/aur-subsonic-beta/

pkgname=subsonic-beta
pkgver=6.1.1
epoch=4 # 5.1.beta sorts higher than 5.1
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="http://subsonic.org/"
license=('CUSTOM')
depends=('java-runtime-headless')
conflicts=('subsonic')
provides=('subsonic')
source=("https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-${pkgver}-standalone.tar.gz"
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
  sed -i 's/SUBSONIC_HOME=\${SUBSONIC_HOME:-\/var\/subsonic}/SUBSONIC_HOME=\${SUBSONIC_HOME:-\/var\/lib\/subsonic\/}/' subsonic.sh
  cp  * $pkgdir/var/lib/subsonic
  rm $pkgdir/var/lib/subsonic/{subsonic.bat,subsonic-${pkgver}-standalone.tar.gz}
  ln -fs /var/lib/subsonic/subsonic.sh $pkgdir/etc/subsonic.conf
  cp $srcdir/subsonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/lib/subsonic/subsonic.sh
}

sha256sums=('ed33a5b7c0543d1cd0463c22e69fcb954b7862dc95c59efbe5456a373239ee2a'
            'f5404721615b6e1ce7b5212b41f8799bc8ed09c8a1a9c5de71e439da41d2c6aa')
sha512sums=('cdd4dd7ec1583fc0342e071b03ec37f1737eb73c53724f6fa1b243b8f3e36b1e4063cc944f997f1f412dcdff03dcea9d37f2ed7f9afc1165526867c0b1238472'
            '9026ea4e216f359146cf325083ddbf051d1d141bf6342ec750723ab891e5a212f55411ce8d0dd9697b8636541618220498fc8aa9b4c680a8d2c34ab7ee4db02e')
