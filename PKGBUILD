# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='siag'
pkgver=3.6.1
pkgrel=3
pkgdesc='A tightly integrated, free office package'
arch=('x86_64')
url='https://siag.nu'
license=('GPL2')
depends=('xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'gmp' 'tcl' 'libxpm' 'xawm' 'nextaw' 'mowitz')

source=("$pkgname-$pkgver.tar.gz::https://siag.nu/pub/siag/siag-3.6.1.tar.gz"
        'siag.patch')
sha256sums=('712633adac591bc48466b12b9012ff51066233b36d0589bc44ed54ba62bcdd5a'
            'a15393853ad6305d66b222306439c950fbcc2b91e26f6e93d372b85834839648')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../siag.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-docdir=/usr/share/doc/siag
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
