# Maintainer: McLenin <mclenin at gooogles email>

pkgname=atomiks
pkgver=1.0.4.1
pkgrel=1
pkgdesc="Atomiks is a faithful remake of, and a tribute to, Atomix, a classic puzzle game"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/atomiks/"
depends=("sdl2_mixer")
license=("GPL3")
source=("http://downloads.sourceforge.net/project/atomiks/v1.0.4.1/atomiks-1.0.4.1.tar.gz" "atomiks.desktop")
md5sums=('1922f6b08e2e537b6ffdce3bf8e4721d'
         'e1e54d118bf749bcaff89a2a18800b14')

build() {
	cd "$srcdir/$pkgname"-"$pkgver"
	#The file size is not that much bigger anyway and it removes a somewhat rare build dependency
	#sed  -i '/upx/d' Makefile
	make
	make editor
}

package() {
	
	cd "$srcdir/$pkgname"-"$pkgver"
	install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D editor ${pkgdir}/usr/bin/${pkgname}-editor	
	install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -D readme.txt ${pkgdir}/usr/share/doc/${pkgname}/readme.txt
	install -D history.txt ${pkgdir}/usr/share/doc/${pkgname}/history.txt
	cd ${srcdir}
	install -D ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
