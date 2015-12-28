# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Alad Wenter <alad@linuxbbq.org>
pkgname=cowdancer
pkgver=0.78
pkgrel=1
pkgdesc="Copy-on-write wrapper for pbuilder"
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/cowdancer"
license=('GPL')
depends=('pbuilder-ubuntu')
optdepends=('qemu: if you want to use qemubuilder'
            'bash-completion: bash autocomplete support')

source=(http://httpredir.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.tar.xz)
sha256sums=('bec4384cf72c3b3d98c3a2dc61832737c3407ff3f121bf5216ab06135b998519')

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
