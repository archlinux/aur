# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>

pkgname=epsxe-plugin-spu-alsa
pkgver=1.9
pkgrel=5
pkgdesc="OSS/Alsa SPU plugin"
url="http://www.pbernert.com"
depends=('epsxe')
source=(http://www.pbernert.com/spupeopsoss109.tar.gz)
md5sums=('b42b316576f9f81775f78d62b3567b16')
license=('custom')
arch=('i686' 'x86_64')

prepare () {

    cd $srcdir/ 
    
    rename $(find . -name "version*" -print) changelog $(find . -name "version*" -print)

    rename $(find . -name "readme*" -print) README $(find . -name "readm*" -print)

}

package () {
    
    cd $srcdir/

    install -d "$pkgdir/usr/share/doc/$pkgname"


    install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" changelog README

    for places in /opt/epsxe/{plugins,cfg}
    do

	install -d "$pkgdir/$places"

    done

    install -m 755 -t "$pkgdir/opt/epsxe/plugins" "libspuPeopsOSS.so.1.0.9"
    install -m 664 -t "$pkgdir/opt/epsxe/cfg" "cfgPeopsOSS" "spuPeopsOSS.cfg"
    
  # permissions
  chown root:games $pkgdir/opt/epsxe/cfg/{cfgPeopsOSS,spuPeopsOSS.cfg}
  chown root:games $pkgdir/opt/epsxe/plugins/libspuPeopsOSS.so.1.0.9
  chmod 755 $pkgdir/opt/epsxe/cfg/cfgPeopsOSS
  chmod 755 $pkgdir/opt/epsxe/plugins/libspuPeopsOSS.so.1.0.9
}
