#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=4.0.11
_buildtime=v20170128-2103
pkgrel=2
pkgdesc='PMD static source code analysis (Java, XML, ...) plugin for Eclipse IDE'
arch=('any')
url='http://pmd.sourceforge.net/'
license=('BSD' 'Apache')
depends=('eclipse>=4.5.0')
options=('!strip')
source=(
	"feature.jar::http://downloads.sourceforge.net/project/pmd/pmd-eclipse/update-site/features/net.sourceforge.pmd.eclipse_${pkgver}.${_buildtime}.jar"
	"plugin.jar::http://downloads.sourceforge.net/project/pmd/pmd-eclipse/update-site/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_buildtime}.jar"
	"license.txt::http://sourceforge.net/p/pmd/code/ci/master/tree/LICENSE?format=raw"
)
noextract=(feature.jar plugin.jar license.txt)
sha256sums=('5479b2f1126c64e063dc0c5555f4bba0528bab5d1ca2577e43fed033fc875997'
            'f6332ddf23c85c44d47e46a3dbcb70eb759c70b618bbe33d191482ff16041e9a'
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
