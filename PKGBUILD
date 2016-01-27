# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=ramspeed
pkgver=2.6.0
pkgrel=2
pkgdesc='Open source memory and cache benchmark (UP version)'
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
license=('custom')
url='http://alasir.com/software/ramspeed/'
# Original source is http://www.alasir.com/software/ramspeed/$pkgname-$pkgver.tar.gz
# but it may not work.
source=(http://sources.buildroot.net/$pkgname-$pkgver.tar.gz Makefile)
md5sums=('546394131a1467a8651e0b8a218970c0'
         '33e5d312ebfe6bb7730ce9695659c560')

prepare() {
	cp Makefile $pkgname-$pkgver/
	sed -i "s:see the manual for details:see /usr/share/doc/$pkgname/README:" \
		$pkgname-$pkgver/$pkgname.c
}

build() {
	cd $pkgname-$pkgver
	export CARCH
	make
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
