# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=raven-reader
pkgver=1.0.46
pkgrel=3
pkgdesc="Simple Desktop RSS Reader made using VueJS"
url="https://github.com/mrgodhani/raven-reader"
license=('MIT')
depends=("libxss" "libxtst" "libappindicator-gtk2" "gconf-gtk2" "libnotify")
provides=("${pkgname}")
_pkgname="Raven\ Reader"
arch=('x86_64')
source=("https://download.helloefficiency.com/ravenreader/Raven Reader-${pkgver}.AppImage"
 "${pkgname}.desktop")
sha512sums=('3b1b3138216507477497237dce874585eb9689ec742c1287177d0b1cbc642f70ef34fbffc510313188727b58a0dcd57c9827baa9436643ee2da85f4b46f8e9d2'
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
	cp -f $pkgname.desktop ${pkgdir}/usr/share/applications/

	chmod -R 755 ${pkgdir}/opt/$pkgname/{locales,resources,swiftshader}
	chmod -R 755 ${pkgdir}/usr
	rm -rdf ${pkgdir}/opt/$pkgname/usr
}
