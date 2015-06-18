#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-pmd
pkgver=4.0.7
_stamp=v20150522-1709
pkgrel=1
pkgdesc='Plug-in to analyze static Java, Javascript, XML, and XSL source code'
arch=('any')
url='http://pmd.sourceforge.net/'
license=('BSD')
depends=('eclipse>=3.4.0')
makedepends=('java-environment-common')
options=('!strip')
source=(
	"feature.jar::http://sourceforge.net/projects/pmd/files/pmd-eclipse/update-site/features/net.sourceforge.pmd.eclipse_${pkgver}.${_stamp}.jar"
	"plugin.jar::http://sourceforge.net/projects/pmd/files/pmd-eclipse/update-site/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_stamp}.jar"
)
noextract=(feature.jar plugin.jar)
sha256sums=('31e08b5c42f5be1076ac2b156242211e49877ab7220f455b7a45ef097de5f898'
            'f5d5ec3d7329aff59cde2cae957d94523984e53386a8d3485b7de190ed4ec154')

package() {
	_dest=$pkgdir/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
	_subfolder=$_dest/features/net.sourceforge.pmd.eclipse_${pkgver}.${_stamp}
	install -dm755 $_subfolder
	cd $_subfolder
	# extract feature
	jar xf $srcdir/feature.jar || return 1
	# copy plugin
	install -Dm644 $srcdir/plugin.jar $_dest/plugins/net.sourceforge.pmd.eclipse.plugin_${pkgver}.${_stamp}.jar
}

