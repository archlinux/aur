#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=4.0.8
_buildtime=v20151003-1954
pkgrel=1
pkgdesc='PMD plugin for Eclipse IDE to analyze static Java, Javascript, XML, and XSL source code'
arch=('any')
url='http://pmd.sourceforge.net/'
license=('BSD')
depends=('eclipse>=4.5.0')
options=('!strip')
source=(
	"feature.jar::http://downloads.sourceforge.net/project/pmd/pmd-eclipse/update-site-latest/features/net.sourceforge.pmd.eclipse_${pkgver}.${_buildtime}.jar"
	"plugin.jar::http://downloads.sourceforge.net/project/pmd/pmd-eclipse/update-site-latest/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_buildtime}.jar"
)
noextract=(feature.jar plugin.jar)
sha256sums=('dadd49ecfe5832f91293b20bdb747506aa6d2330a7fbc802819c7049598e4c77'
            'a40c8a27d0ba07619b1e0693634ec7465b1c760135b4f9807b7a8a8959f0faf0')

package() {
	_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
	_subfolder=$_dest/features/net.sourceforge.pmd.eclipse_${pkgver}.${_buildtime}
	install -dm755 $_subfolder
	cd $_subfolder
	# extract feature
	jar xf $srcdir/feature.jar || return 1
	# copy plugin
	install -Dm644 $srcdir/plugin.jar $_dest/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_buildtime}.jar
}

