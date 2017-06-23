#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=4.0.14
_buildtime=v20170528-1456
pkgrel=1
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
sha256sums=('e1e705a18d9738341a90ae97ed330ad91f990a9890a83f4239f190ef54c237c0'
            '9f23ab6ccf10de26a8673a0b8c1b02ce369a51c1830f54e79d494ddcb1fdabb5'
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
