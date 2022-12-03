pkgname=hode-git
pkgver=0.2.9f+r4.26bcf11
pkgrel=1
pkgdesc="Heart of Darkness engine rewrite"
arch=(x86_64 aarch64)
url=http://cyxdown.free.fr/hode/
license=(unknown)
makedepends=(sdl2)
optdepends=('heart-of-darkness: provides game data for hode engine')
install=hode.install
source=(
	git+https://github.com/cyxx/hode.git
	hode.{ini,sh,desktop}
	amazing.webp	# https://heartofdarkness.ca/Download/Demos/ECTS1995HoDpresskit.zip (ECTS1995HoDpresskit/LOGO/AMAZINGB.TIF)
	amazing32.png)
md5sums=(
	SKIP
	874bc298ab565d2d5141101781ef1082
	8afb36729d190e64ab93c923981b1312
	bfdd04e5fdc88f9dfcc2664bbb7578d6
	2d93e887790f571880621e37e1bb24fa
	f9b6c6fbc11be79cd22e409086e7f5c2)
pkgver(){
	cd hode
	git describe --tags|sed 's/-\(.*\)-g/+r\1./'
}
build(){
	cd hode
	sed -i 's/kFrameDuration)/128)/' paf.cpp	# fix treehouse frame rate
	make
}
package(){
	install hode/hode hode.sh -Dt "$pkgdir"/usr/bin
	install hode.ini -Dt "$pkgdir"/usr/share/hode
	install amazing.webp -D "$pkgdir"/usr/share/icons/hicolor/512x512/apps/amazing.png
	install -D {amazing32,"$pkgdir"/usr/share/icons/hicolor/32x32/apps/amazing}.png
	install hode.desktop -Dt "$pkgdir"/usr/share/applications
	install hode/*.{txt,yaml} -Dt "$pkgdir"/usr/share/doc/hode
}
