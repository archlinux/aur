# Maintainer: Yoan Blanc <yoan@dosimple.ch>
pkgname=getax
pkgver=2025
_update=1
pkgrel=1
pkgdesc="Application for the tax reporting of physical people in the canton of Geneva, Switzerland."
url="http://www.getax.ch/support/"
depends=(
	'webkitgtk2'
	'java-runtime=17'
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
sha256sums=('b1212d00284766aede124dd3002f266c9ccca08c07d8d523bbf9c05b65a904ca'
            '3181ec6cbeee183de2279e75265c464e7b17f9f7e447cdbebbfbdd9af1ad2599')
