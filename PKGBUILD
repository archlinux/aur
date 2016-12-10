# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: LTSmash <lord.ltsmash@gmail.com>
# Contributor: Zauber Exonar <zauberexonar at gmail>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=opensimulator-osgrid
pkgver=20161210.v0.9.1.f574039
_realpkgver=12102016.v0.9.1.f574039
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
md5sums=('af9449bc41992e3fb0135e1b7d6a5921'
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
chmod 755 $pkgdir/opt/$pkgname/bin/opensim-ode.sh
# chmod 666 "$pkgdir"/opt/$pkgname/bin/OpenSim.log
# install launch script
install -m755 -D ../osgrid.sh $pkgdir/usr/bin/osgrid
}
