# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=squaw
pkgver=2.7
pkgrel=1
pkgdesc='Simplistic Qt-based user agent for the Web'
url='http://fenua.org/gaetan/src/'
license=('ISC')
depends=('qt5-webkit')
arch=('i686' 'x86_64' 'armv7h')
source=("${url}/${pkgname}-${pkgver}.cpp")
sha1sums=('bf58cabd733a4751a8d037815de55575f8cab172')

build() {
	cd "${srcdir}"
	moc-qt5 -o squaw.moc squaw-${pkgver}.cpp
	c++ -lQt5WebKitWidgets -lQt5PrintSupport -lQt5Widgets -lQt5WebKit -lQt5Gui -lQt5Network -lQt5Core \
		-I/usr/include/qt -fPIC \
		${CPPFLAGS} ${CXXFLAGS} ${LDFLAGS} \
		-o ${pkgname} ${pkgname}-${pkgver}.cpp
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	head -n 15 "${pkgname}-${pkgver}.cpp" > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
