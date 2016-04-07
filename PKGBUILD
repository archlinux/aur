# Maintainer: Daniel Mirkin <danielmirkin at gmail.com>

pkgname=tinybldlin
pkgver=0.8.1
pkgrel=1
pkgdesc="Tiny PIC Bootloader for Microchip microcontrollers, GNU/Linux port"
arch=('i686' 'x86_64')
url="http://tinybldlin.sourceforge.net/index.php"
license=('GPL2')
depends=('pygtk' 'wxpython2.8' 'python2-pyserial')
conflicts=('tinybldlin<0.8.1')
source=("https://sourceforge.net/projects/tinybldlin/files/$pkgname-$pkgver-src.tar.gz")
md5sums=('b4d65608bdf2766ba22e5d9367574a32') #generate with 'makepkg -g'

prepare() {
	cd "$srcdir/$pkgname"
	rm -r .bzr
	rm -r debian
	cd "$srcdir/$pkgname/src/bin/"
	sed -i 's|python|python2|g' tinybldlin

}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
