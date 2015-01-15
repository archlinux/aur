# Maintainer: Thom Wiggers <thom@thomwiggers.nl>
# Contributors: M0Rf30 <morf3089@gmail.com>
# Contributors: hoban
# Contributors: Nrm
#
# This package can be found at https://github.com/thomwiggers/aur-subsonic-beta/

pkgname=subsonic-beta
pkgver=5.1.beta2
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="http://subsonic.org/"
license=('GPL')
depends=('java-runtime-headless')
conflicts=('subsonic')
source=(http://prdownloads.sourceforge.net/subsonic/subsonic-${pkgver}-standalone.tar.gz      
	    'subsonic.service')
backup=('var/lib/subsonic/db')
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

md5sums=('287ad8222abb7f68c1aef63e8ff2bd03'
         '7cbbb9c8357992385c929e9f05be00be')
sha1sums=('9744234c747e5747d899af7b86b0ae2fc57f9da8'
          '71a3cb05a686e97423a7a5195ff05ad5f2a1cb30')
sha512sums=('337056914750eec6de6d3970a20c3739df31c7c7825448dedff5dd12b35c407e78382a9316dab4597c9054a14cec363f62cc0566203511a993b9ccc8b70cb833'
            '9026ea4e216f359146cf325083ddbf051d1d141bf6342ec750723ab891e5a212f55411ce8d0dd9697b8636541618220498fc8aa9b4c680a8d2c34ab7ee4db02e')
