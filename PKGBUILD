# Maintainer: Yoan Blanc <yoan@dosimple.ch>
pkgname=getax
pkgver=2019
_update=1.03
pkgrel=4
pkgdesc="Application for the tax reporting of physical people in the canton of Geneva, Switzerland."
url="http://www.getax.ch/support/"
depends=(
	'gnome-vfs'
	'java-runtime=8'
	'webkitgtk2'
)
arch=(x86_64)
license=('unknown')
_base="https://www.getax.ch/getaxpp"
source=(
	"$pkgname-$pkgver-$_update.tar.gz::$_base/$pkgver/$pkgname$pkgver.tar.gz"
	"getax"
)
_dirname="getax-pp-$pkgver"

prepare() {
	# Skip provided Java
	rm -rf $_dirname/jre
}
package() {
	cd "$_dirname"

	_app_home=/usr/share/${pkgname}

	install -d "${pkgdir}"{${_app_home}/bin,/usr/bin}

	cp -r config lib model "${pkgdir}${_app_home}"
	install -D -m644 version.xml "${pkgdir}${_app_home}/version.xml"

	install -m755 "${srcdir}"/${pkgname} "${pkgdir}"${_app_home}/bin/${pkgname}
	ln -s ${_app_home}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
sha256sums=(
	'0ae1b0678e59fc5a2c6a4f2aa9d8a60ab67d4e29605e704d0813ecf1bd633f49'
	'a474ed38201b0abc1459ff0ffa37a1fb0e947a135a18e08cb00acadad23488be'
)
validgpgkeys=(
	'9E2D 407E AFEE 5086 3F42  B9D1 6058 CF45 7429 8812'
)
