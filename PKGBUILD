#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=4.2.0
_buildtime=v20190331-1136
pkgrel=2
pkgdesc='PMD static source code analysis (Java, XML, ...) plugin for Eclipse IDE'
arch=('any')
url='http://pmd.sourceforge.net/'
license=('BSD' 'Apache')
depends=('eclipse>=4.5.0')
options=('!strip')
source=(
	"feature.jar::https://dl.bintray.com/pmd/pmd-eclipse-plugin/releases/${pkgver}.${_buildtime}/features/net.sourceforge.pmd.eclipse_${pkgver}.${_buildtime}.jar"
	"plugin.jar::https://dl.bintray.com/pmd/pmd-eclipse-plugin/releases/${pkgver}.${_buildtime}/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_buildtime}.jar"
	"license.txt::http://sourceforge.net/p/pmd/code/ci/master/tree/LICENSE?format=raw"
)
noextract=(feature.jar plugin.jar license.txt)
sha256sums=('9c32467883de35579ada273c9ba7cf7db92b3664ed9cf9a942050492e2579a53'
            'ac3d04c954ef64629a35c53a23df104c0b55407c486ad41bf6f862e0997f34fc'
            'bc61ca15a6e980814d4183a0d37713179a682a8376fe4304c0d99792af62025c')

package() {
	_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
	_subfolder=$_dest/features/net.sourceforge.pmd.eclipse_${pkgver}.${_buildtime}
	install -dm755 $_subfolder
	cd $_subfolder
	# extract feature
	jar xf $srcdir/feature.jar || return 1
	# copy plugin
	install -Dm644 $srcdir/plugin.jar $_dest/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_buildtime}.jar
	install -Dm644 $srcdir/license.txt $pkgdir/usr/share/licenses/eclipse-pmd/license.txt
}
