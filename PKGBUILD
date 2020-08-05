# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.1.5
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('23c8ac164ee549ad5aa87ff5e1ca5054605a4596fb89544815e5ae654bf4ce72558877a68ac3686694216196d89296a35e10a0888361d56831385c07bb15d227'
            '5a57b49d2784c6d994d85897c5c765a0929e170cbf9697512fc5468db0db44962db6701147f00e90682ab4bc1b7882dc15a9c69ac43f3a16ab2bded7b93f00fd')
sha256sums=('f7e30ec71978082ec128e9427beb437b5538248c3375ddf82619c2fe8775b5fe'
            '2835266d22367167c4b8c98d1227a1a3d48f4b425c259d31af8f17ca75d7e40b')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP
	make
}

check() {
	cd "bc-$pkgver"
	make check
}

package() {
	cd "bc-$pkgver"
	DESTDIR="$pkgdir/" make install
}
