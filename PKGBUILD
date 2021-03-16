# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=raven-reader
pkgver=1.0.48
pkgrel=1
pkgdesc="Simple Desktop RSS Reader made using VueJS"
url="https://github.com/mrgodhani/raven-reader"
license=('MIT')
depends=("libxss" "libxtst" "libappindicator-gtk2" "gconf-gtk2" "libnotify")
provides=("${pkgname}")
_pkgname="Raven\ Reader"
arch=('x86_64')
source=("https://download.helloefficiency.com/ravenreader/Raven Reader-${pkgver}.AppImage"
 "${pkgname}.desktop")
sha512sums=('4c24322d068498227a739e0d4f697ba30cfe1f9f2b62558f5cc5851a19acf7b4d1c3a182a0e32eb83ff404924d1b653a8ef77811acb0778143840031c10dd018'
            '9fa28be0cfac906f0d6acb6be147f797999660fda207df0b282a132950e587b5db0e77c719a38892bf6bc5e1cd77e5e9e24bf9ba169fd5505abd2dcd71ed27cf')

build(){
	cd ${srcdir}
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
}
package() {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/opt/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications

	cp -pR ${srcdir}/squashfs-root/* ${pkgdir}/opt/$pkgname/
	mv -uf ${pkgdir}/opt/$pkgname/usr/share/icons ${pkgdir}/usr/share/
	cp -Luf $pkgname.desktop ${pkgdir}/usr/share/applications/

	chmod -R 755 ${pkgdir}/opt/$pkgname/{locales,resources,swiftshader}
	chmod -R 755 ${pkgdir}/usr
	rm -rdf ${pkgdir}/opt/$pkgname/usr
}
