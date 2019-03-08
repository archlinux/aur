#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=4.1.0
_buildtime=v20190307-2036
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
sha256sums=('6d24740a856cf46fcc44861cc76b20ec65df9aaa70e66289bb67b063f79c5e83'
            '629905beaa6f78709e54590635e9ab192333dfc8016496d76af490c77dfbe1f4'
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
