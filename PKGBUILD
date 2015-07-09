# Maintainer: Antonio Vázquez <antoniovazquezblanco[at]gmail[dot]com>

pkgname=firmware-mod-kit
pkgver=0.99
pkgrel=6
pkgdesc="This kit allows for easy deconstruction and reconsutrction of firmware images for various embedded devices."
provides=('firmware-mod-kit')
source=('https://firmware-mod-kit.googlecode.com/files/fmk_099.tar.gz')
depends=('python2-magic')
url="http://code.google.com/p/firmware-mod-kit/"
license=('GPL')
arch=('i686' 'x86_64')
md5sums=('91bd2cb3803880368af369d07271b5b9')
options=(!strip)

build() {
	cd $srcdir/fmk/src
	sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' binwalk-1.0/src/bin/binwalk-script 
	./configure || return 1
	make || return 1
	return 0
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/opt/
	mv fmk $pkgdir/opt/firmware-mod-kit
}
