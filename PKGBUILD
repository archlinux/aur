# Maintainer: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

pkgname=raven-reader
pkgver=1.0.79
pkgrel=1
pkgdesc="Simple Desktop RSS Reader made using VueJS"
url="https://github.com/hello-efficiency-inc/raven-reader"
license=('MIT')
depends=("libxss" "libxtst" "libappindicator-gtk2" "gconf-gtk2" "libnotify")
provides=("${pkgname}")
_pkgname="Raven\ Reader"
arch=('x86_64')
# source=("https://download.helloefficiency.com/ravenreader/Raven Reader-${pkgver}.AppImage"

source=("https://github.com/hello-efficiency-inc/raven-reader/releases/download/v${pkgver}/Raven-Reader-${pkgver}.AppImage"
        "${pkgname}.desktop")
sha512sums=('99d5325b96430200586b3f3edc612d1d246091fc8e7e75d7e122d6532a39529da210ff040311eea44bb744aa3e9ef8fd803d8ae000cb852153e01c1b50244ce9'
            '9fa28be0cfac906f0d6acb6be147f797999660fda207df0b282a132950e587b5db0e77c719a38892bf6bc5e1cd77e5e9e24bf9ba169fd5505abd2dcd71ed27cf')

build(){
	cd ${srcdir}
	chmod +x Raven-Reader-${pkgver}.AppImage
	./Raven-Reader-${pkgver}.AppImage --appimage-extract
}
package() {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/opt/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications

	cp -pR ${srcdir}/squashfs-root/* ${pkgdir}/opt/$pkgname/
	mv -uf ${pkgdir}/opt/$pkgname/usr/share/icons ${pkgdir}/usr/share/
	cp -Luf $pkgname.desktop ${pkgdir}/usr/share/applications/

	chmod -R 755 ${pkgdir}/opt/$pkgname/{locales,resources}
	chmod -R 755 ${pkgdir}/usr
	rm -rdf ${pkgdir}/opt/$pkgname/usr
}
