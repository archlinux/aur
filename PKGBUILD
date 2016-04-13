# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.79
pkgrel=1
pkgdesc="Copy-on-write wrapper for pbuilder"
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/cowdancer"
license=('GPL')
depends=('pbuilder-ubuntu')
optdepends=('qemu: if you want to use qemubuilder'
            'bash-completion: bash autocomplete support')

source=(http://httpredir.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.tar.xz)
sha256sums=('0b9fc98f22b37d3a499a6648a35a5739f858148a4496e09d7474002b0c68c344')

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
