#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-spotbugs
pkgver=3.1.13
_buildtime=201903011226-5013623
pkgrel=2
pkgdesc='SpotBugs plugin for Eclipse IDE to look for bugs in Java programs by static code analysis, a successor of FindBugs.'
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
sha256sums=('a13b500c971c1926afad4982b0be550423dc540f62ccbd869a59ee043cb81cf5'
            '373c7cc4c2a00b3ffd8678251f2d31fc907ee4c202474e3f318969a1838f0daf')

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
