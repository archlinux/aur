pkgname=hode-git
pkgver=0.2.9f+r7.abaa416
pkgrel=2
pkgdesc='Heart of Darkness engine rewrite'
arch=(x86_64 aarch64)
url=http://cyxdown.free.fr/hode/
license=(unknown)
makedepends=(sdl2)
optdepends=('heart-of-darkness-demo: provides game data for hode engine')
install=hode.install
source=(
	git+https://github.com/cyxx/hode
	hode.{ini,sh,desktop}
	amazing.webp	# https://heartofdarkness.ca/Download/Demos/ECTS1995HoDpresskit.zip (ECTS1995HoDpresskit/LOGO/AMAZINGB.TIF)
	amazing32.png)
cksums=(SKIP{,,,,,})
pkgver(){
	cd hode
	git describe --tags|sed s/-/+r/\;s/-g/./
}
build(){
	cd hode
	sed -i /kFrameDuration/s/80/128/ defs.h	# fix treehouse frame rate
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
