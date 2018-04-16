# Maintainer: Erin Kinsley <ybden@ybden.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc
pkgver=1.14.3
pkgrel=2
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project'
arch=('i686' 'x86_64')
url='http://mdocml.bsd.lv/'
license=('custom: ISC')
depends=('zlib')
provides=('man')
conflicts=('man')
source=("http://mdocml.bsd.lv/snapshots/$pkgname-$pkgver.tar.gz"
        'configure.local'
        'mandoc.service'
        'mandoc.timer')
sha256sums=('0b0c8f67958c1569ead4b690680c337984b879dfd2ad4648d96924332fd99528'
            'f0e8ddb61d063bec02a6a1f73f5d979bb548e7aabcf0a27c0d5c29c4194bfc8e'
            '2091411d5f87a3c371a5ba74b4773d1e454046446fa2cb045485979e52419bb6'
            '79d4e73b6c8cab7e12d11f8b4574790938064b42effbb02afadc1548dfcf5cc4')

prepare() {
	cp "$srcdir"/configure.local $pkgname-$pkgver
}

build() {
	cd $pkgname-$pkgver
	./configure
	make
}

package() {
	cd $pkgname-$pkgver
	DESTDIR="$pkgdir" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
