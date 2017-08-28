# Maintainer: Erin Kinsley <ybden@ybden.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc
pkgver=1.14.1
pkgrel=1
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project'
arch=('i686' 'x86_64')
url='http://mdocml.bsd.lv/'
license=('custom: ISC')
depends=('zlib')
provides=('man')
conflicts=('man' 'groff')
source=("http://mdocml.bsd.lv/snapshots/mdocml-$pkgver.tar.gz"
        'configure.local'
        'mandoc.service'
        'mandoc.timer')
sha256sums=('356954f141ec6f5635e938c826f2e16e4619bb361c64d84a31f6775d030a615b'
            '2ab7b2c4f7511de4b1132d718be04286911a562962bc415d6261c5c0ae595e6b'
            '2091411d5f87a3c371a5ba74b4773d1e454046446fa2cb045485979e52419bb6'
            '79d4e73b6c8cab7e12d11f8b4574790938064b42effbb02afadc1548dfcf5cc4')

prepare() {
	cp "$srcdir"/configure.local mdocml-$pkgver
}

build() {
	cd mdocml-$pkgver
	./configure
	make
}

package() {
	cd mdocml-$pkgver
	DESTDIR="$pkgdir" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
