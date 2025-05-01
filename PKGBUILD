# Maintainer:  oech3

pkgname=cursor-electron-latest
pkgver=0.49.6
pkgrel=1
pkgdesc="Cursor (latest electron)"
arch=('any')
url="https://www.cursor.com"
depends=(cursor-electron electron)
makedepends=(cursor-electron)
options=(!strip)
build() {
	sed 's/name=electron.*/name=electron/' /usr/bin/cursor > ${pkgname}
	sed -e "s/^Exec=.*/Exec=${pkgname}/" -e "s/^Name=.*/Name=${pkgdesc}/" /usr/share/applications/cursor.desktop > ${pkgname}.desktop
}
package(){
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -d "${pkgdir}/usr/share/cursor"
	ln -sf /usr/bin/${pkgname} "${pkgdir}/usr/share/cursor/${pkgname}"	
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
