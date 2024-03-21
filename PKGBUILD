# Maintainer: Stezko <stezko@gmail.com>
# Contributor: SAFIB LTD <service.assist@safib.ru>

pkgname=assistant
pkgver=5.6.2
pkgrel=2
_pkg=972
pkgdesc='Secure remote access to computers over a local network or over the Internet.'
arch=('x86_64')
license=('custom:SAFIB LTD')
url="https://xn--80akicokc0aablc.xn--p1ai/"
depends=('bash' 'gtk2' 'gtk-engine-murrine')
options=('!strip')
install=${pkgname}.install
source=("${url}%D1%81%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C/Download/${_pkg}"
	"https://github.com/libsdl-org/libtiff/archive/refs/tags/v4.5.0.tar.gz")
md5sums=('8BCB7690394CA23CFBFA4DBB93BE257E'
	 'c072e49de5bfdee6a2c2456dc15a56c2')

build() {

	# Libtiff build, package requires 4.5.0 version
	
	tar -xvf v4.5.0.tar.gz  
	cd "libtiff-4.5.0"
	autoreconf -fi
	./configure
	make
}


package() {
	sh "${_pkg}" --tar -xvf
	mkdir ${pkgdir}/opt
	tar -C ${pkgdir}/opt/ -xvf ${pkgname}.tar.gz
 	cp "${srcdir}/libtiff-4.5.0/libtiff/.libs/libtiff.so.6.0.0" "${pkgdir}/opt/${pkgname}/lib/libtiff.so.6"
	install -Dm644 "${pkgdir}/opt/${pkgname}/license/License.rtf" "${pkgname}/usr/share/licenses/${pkgname}/License.rtf"
	find "${pkgdir}" -type d -print0 |xargs -0 chmod 755

}
