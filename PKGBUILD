# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=raven-reader
pkgver=0.5.0
pkgrel=0
pkgdesc="Simple Desktop RSS Reader made using VueJS"
url="https://github.com/mrgodhani/raven-reader"
license=('MIT')
depends=('libxss>=1.2.3' 'libxtst>=1.2.3' 'libappindicator-gtk2>=12.10.0' 'gconf>=3.2.6+11+g07808097' 'libnotify>=0.7.8')
provides=("${pkgname}")
arch=('x86_64')
source=("https://github.com/mrgodhani/raven-reader/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.AppImage"
 "${pkgname}.desktop")
sha512sums=('0fd4331b1cdf148fa0bbac6f1d9f1d89d5f27da2ca8a7a0fb597be4b0e8e668912fd7efedbc30e06c98be31c410225d2be8d7a53ce59c66a6b9b0daff0d0a803'
            '901cb672dfb53fb2c3bd11e7075cc3fa8fba69fcb201102390058acd3c84b6e2ca36aea9b6bddb05461947c9ad1a0e0fb3b79664bceca062ed5a6511d02982b7')

build(){
	cd ${srcdir}
	chmod +x ${pkgname}-${pkgver}-x86_64.AppImage
	./${pkgname}-${pkgver}-x86_64.AppImage --appimage-extract
}
package() {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/opt/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications

	cp -pR ${srcdir}/squashfs-root/* ${pkgdir}/opt/$pkgname/
	mv -uf ${pkgdir}/opt/$pkgname/usr/share/icons ${pkgdir}/usr/share/
	mv -uf $pkgname.desktop ${pkgdir}/usr/share/applications/

	rm -rdf ${pkgdir}/opt/$pkgname/usr
}
