#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=7.18.0
_buildtime=v20251031-1002-r
pkgrel=1
pkgdesc='PMD static source code analysis (Java, XML, ...) plugin for Eclipse IDE'
arch=('any')
url='http://pmd.sourceforge.net/'
license=('BSD' 'Apache')
depends=('eclipse>=4.5.0')
options=('!strip')
source=(
	"feature.jar::https://pmd.github.io/pmd-eclipse-plugin-p2-site/${pkgver}.${_buildtime}/features/net.sourceforge.pmd.eclipse_${pkgver}.${_buildtime}.jar"
	"plugin.jar::https://pmd.github.io/pmd-eclipse-plugin-p2-site/${pkgver}.${_buildtime}/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_buildtime}.jar"
	"license.txt::http://sourceforge.net/p/pmd/code/ci/master/tree/LICENSE?format=raw"
)
noextract=(feature.jar plugin.jar license.txt)
sha256sums=('7339fd1ae85429fc0301207456265d7549ada3054800240e6138f9e7695c69be'
            '3de830c6f58b3457065209cf3fcb5287774436f7b020ed671b2167a01621474a'
            '296dae48eae5658f449a89cf512b8e05386c9c5adfb23d74cfb24efa145625db')

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
