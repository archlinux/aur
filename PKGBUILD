# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=ramsmp
pkgver=3.5.0
pkgrel=1
pkgdesc='Open source memory and cache benchmark (SMP version)'
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
license=('custom')
url='http://alasir.com/software/ramspeed/'
# Original source is http://www.alasir.com/software/ramspeed/$pkgname-$pkgver.tar.gz
# but it may not work.
source=(http://sources.buildroot.net/$pkgname-$pkgver.tar.gz Makefile)
md5sums=('c26b32c752c603e17c28a1cab4348682'
         '4069edc026df25b6d0a609a552b3a469')

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
