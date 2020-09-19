#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-objectaid
pkgver=1.2.4
pkgrel=2
pkgdesc='Create UML class diagrams from existing Java source code and libraries with this plugin for Eclipse IDE.'
arch=('any')
url='http://www.objectaid.com'
license=('ObjectAid Class Diagram Editor License')
depends=('eclipse>=4.5.0' eclipse-gef3)
options=('!strip')
source=(
	"https://www.objectaid.com/update/current/objectaid-$pkgver.zip"
)
sha256sums=('0eea5dba170fbd8dc3b0d5d11024437b3227a87bd2eb19d337f90256457f352a')

package() {
	_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
	# extract feature
	_feature=features/com.objectaid.uml.cls_$pkgver.jar
	install -dm755 ${_dest}/${_feature%*.jar}
	cd ${_dest}/${_feature/.jar}
	jar xf ${srcdir}/${_feature} || return 1
	# copy plugins
	install -Dm644 $srcdir/plugins/com.objectaid.uml_$pkgver.jar $_dest/plugins/com.objectaid.uml_$pkgver.jar
	install -Dm644 $srcdir/plugins/com.objectaid.uml.cls_$pkgver.jar $_dest/plugins/com.objectaid.uml.cls_$pkgver.jar
	install -Dm644 $srcdir/plugins/com.objectaid.uml.java_$pkgver.jar $_dest/plugins/com.objectaid.uml.java_$pkgver.jar
	install -Dm644 $srcdir/plugins/com.objectaid.uml.cls.java_$pkgver.jar $_dest/plugins/com.objectaid.uml.cls.java_$pkgver.jar
	# copy license
	install -Dm644 $srcdir/../license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
