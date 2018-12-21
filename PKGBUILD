#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-spotbugs
pkgver=3.1.11
_buildtime=201812210434-554d102
pkgrel=2
pkgdesc='SpotBugs plugin for Eclipse IDE to look for bugs in Java code by static code analysis'
arch=('any')
url='https://github.com/spotbugs/spotbugs/'
license=('LGPL')
depends=('eclipse>=4.5.0')
options=('!strip')
source=(
	"feature.jar::https://spotbugs.github.io/eclipse-stable-latest/features/com.github.spotbugs.plugin.eclipse_${pkgver}.${_buildtime}.jar"
	"plugin.jar::https://spotbugs.github.io/eclipse-stable-latest/plugins/com.github.spotbugs.plugin.eclipse_${pkgver}.${_buildtime}.jar"
)
noextract=(feature.jar plugin.jar)
sha256sums=('ed197bcba2685dd4dabf9bc421cee7a26de8ad4bbe2069fe09b0c562aa1e3bc6'
            '653cd15370db01244bc00c1521fedc8019a09befd1be8d5c4a1b556d7fa54a32')

package() {
	_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
	_subfolder=$_dest/features/com.github.spotbugs.plugin.eclipse_${pkgver}.${_buildtime}
	install -dm755 $_subfolder
	cd $_subfolder
	# extract feature
	jar xf $srcdir/feature.jar || return 1
	# copy plugin
	install -Dm644 $srcdir/plugin.jar $_dest/plugins/com.github.spotbugs.plugin.eclipse_${pkgver}.${_buildtime}.jar
}
