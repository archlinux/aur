# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: LTSmash <lord.ltsmash@gmail.com>
# Contributor: Zauber Exonar <zauberexonar at gmail>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=opensimulator-osgrid
pkgver=20170702.v0.9.1.c5a4c29
_realpkgver=07022017.v0.9.1.c5a4c29
pkgrel=1
pkgdesc="OSGrid's distribution of OpenSimulator, preconfigured to connect with OSGrid"
arch=('i686' 'x86_64')
url="http://www.osgrid.org"
license=('BSD')
depends=('mono' 'sqlite')
makedepends=('unzip')
install=$pkgname.install
backup=('opt/opensimulator-osgrid/bin/OpenSim.ini'
		'opt/opensimulator-osgrid/bin/config-include/GridCommon.ini')
source=("http://danbanner.onikenkon.com/osgrid//osgrid-opensim-${_realpkgver}.zip" \
	"osgrid.sh")
md5sums=('e79fd86eb6284b2f2cb5487b4d38eb18'
         '8ad5aab5c434aef00d12b08343a5da5a')

package() {
cd $srcdir/bin

#copying Mono.Posix.dll so that OpenSimulator can use sockets, and by extension MySQL
cp /usr/lib/mono/4.5/Mono.Posix.dll Mono.Posix.dll
# install
install -d $pkgdir/opt/$pkgname/bin
cp -r ./* $pkgdir/opt/$pkgname/bin/
# set permissions
find $pkgdir/opt/$pkgname/bin -type d -exec chmod 755 {} +
find $pkgdir/opt/$pkgname/bin -type f -exec chmod 644 {} +
find $pkgdir/opt/$pkgname/bin -name "*.exe" -exec chmod 755 {} +
find $pkgdir/opt/$pkgname/bin -name "*.ini" -exec chmod 666 {} +
find $pkgdir/opt/$pkgname/bin -name "*.xml" -exec chmod 666 {} +
chmod 777 $pkgdir/opt/$pkgname/bin/{,*/}
chmod 755 $pkgdir/opt/$pkgname/bin/opensim.sh
# chmod 666 "$pkgdir"/opt/$pkgname/bin/OpenSim.log
# install launch script
install -m755 -D ../osgrid.sh $pkgdir/usr/bin/osgrid
}
