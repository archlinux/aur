# Maintainer: Aleksandr Arlanow <aleksandr@arlanow.ru>
pkgname=evelauncher
pkgver=1222103
pkgrel=1
pkgdesc="Unofficial Eve Online Launcher."
arch=('any')
url="https://forums.eveonline.com/t/eve-launcher-for-linux/7286"
license=('custom')
depends=('qt5-base'
        'qt5-translations'
        'qt5-webengine'
        'qt5-webkit'
        'qt5-webview'
        'qt5-websockets'
        'openssl'
        'lib32-libldap'
        )
source=(
	"https://binaries.eveonline.com/evelauncher-1222103.tar.gz"
	"evelauncher.desktop"
	"icon.png")
md5sums=('4826d964df741da50b90f23d237e2006'
         '2150407bf15ea647a0854c0c9df4c887'
         'ecd3b7d8dd554f8106045e1d78a885c6')

package() {
	# Install the main files.
  	install -d "${pkgdir}/opt/${pkgname}"
  	rm ${srcdir}/evelauncher/libQt5* ${srcdir}/evelauncher/QtWebEngineProcess
  	rm -r "${srcdir}/evelauncher/plugins/"
  	rm -r "${srcdir}/evelauncher/resources/"
  	cp -a "${srcdir}/evelauncher/." "${pkgdir}/opt/${pkgname}"
  	ln -s "/usr/lib/qt/libexec/QtWebEngineProcess" "${pkgdir}/opt/${pkgname}"
  	ln -s "/usr/lib/qt/plugins/" "${pkgdir}/opt/${pkgname}"
    ln -s "/usr/share/qt/resources/" "${pkgdir}/opt/${pkgname}"
    ln -s "/usr/share/qt/translations/" "${pkgdir}/opt/${pkgname}"
  	
	# Exec bit
  	chmod 755 "${pkgdir}/opt/${pkgname}/evelauncher"

  	# Desktop Entry
  	install -d "${pkgdir}/usr/share/applications"
  	install "${srcdir}/evelauncher.desktop" "${pkgdir}/usr/share/applications"
	
	install -d "${pkgdir}/opt/${pkgname}"
	install "${srcdir}/icon.png" "${pkgdir}/opt/${pkgname}"	
	
  	# Main binary
 	install -d "${pkgdir}/usr/bin"
 	ln -s "/opt/${pkgname}/evelauncher" "${pkgdir}/usr/bin/${pkgname}"
}
