# Maintainer: M0Rf30
# Contributors: Thom Wiggers <thom@thomwiggers.nl>
# Contributors: hoban
# Contributors: Nrm
# Contributors: MattScherbatsky
 
pkgname=subsonic
pkgver=6.0
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="http://subsonic.org/"
license=('GPL')
depends=('java-runtime-headless')
conflicts=('subsonic')
source=(http://subsonic.org/download/subsonic-${pkgver}-standalone.tar.gz      
        'subsonic.service')
backup=('var/lib/subsonic/db' 'var/lib/subsonic/subsonic.properties' 'var/lib/subsonic/subsonic.sh')
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
 
md5sums=('5bfb0c06585d087801a6b67c6cb2bd78'
         '7cbbb9c8357992385c929e9f05be00be')
