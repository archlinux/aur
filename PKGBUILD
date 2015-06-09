# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>

pkgname=epsxe-plugin-padjoy
pkgver=0.82
pkgrel=2
pkgdesc="Joy-device plugin"
url="http://www.ammoq.com"
depends=('epsxe')
arch=(i686 x86_64)
license=(GPL2)
source=("http://members.chello.at/erich.kitzmueller/ammoq/down/padJoy082.tgz")

md5sums=('510fde521e641f002f39d132e56b6811')

package () {
  cd $srcdir/padJoy
  
  install -d $pkgdir/opt/epsxe/{cfg,plugins}

  if [ "$CARCH" = "x86_64" ]; then

      install -m 755 bin/cfgPadJoy \
	  $pkgdir/opt/epsxe/cfg && \
	  \
	  install -m 755 bin/libpadJoy* \
	  $pkgdir/opt/epsxe/plugins
  
  else 

      make -C src && \
	  \
	  install -m 755 src/cfgPadJoy \
	  $pkgdir/opt/epsxe/cfg && \
	  \
	  install -m 755 src/libpadJoy* \
	  $pkgdir/opt/epsxe/plugins
  fi

  touch $pkgdir/opt/epsxe/cfg/padJoy.cfg

  chown -R root:games $pkgdir/opt/epsxe
  chmod 775 $pkgdir/opt/epsxe/cfg
  chmod 664 $pkgdir/opt/epsxe/cfg/*.cfg
}
