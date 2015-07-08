# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.73
pkgrel=6
pkgdesc="Copy-on-write wrapper for pbuilder"
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/cowdancer/"
license=('GPL')
depends=('pbuilder-ubuntu')
optdepends=('qemu: if you want to use qemubuilder')

source=(http://httpredir.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.tar.gz)
sha256sums=('59fde4bd0347258e797f06b36acaf5a42816b0f5d416d85b0493eac0594f77a9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	ln -sr $pkgdir/usr/bin $pkgdir/usr/sbin
	make DESTDIR="$pkgdir" install
	rm $pkgdir/usr/sbin
	
}
