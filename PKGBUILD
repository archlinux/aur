# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
pkgname=ciderpress
pkgver=4.1.1
_pkgver=4.1.1
pkgrel=1
epoch=
pkgdesc="Apple II file and disk image utility"
arch=('x86_64')
url="https://a2ciderpress.com/"
license=('GPL')
depends=(zlib)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fadden/ciderpress/archive/refs/tags/v$_pkgver.tar.gz")
md5sums=('61753840c89be68b23f52c0b7ce87531')

build() {
	cd "$srcdir"/$pkgname-$_pkgver

	cd nufxlib
	./configure --prefix=/usr
	make -j1

	cd ../diskimg
	make -j1

	cd libhfs
	make -j1

	cd ../../linux
	make -j1
}

package() {
	cd "$srcdir"/$pkgname-$_pkgver

	cd linux
	install -dm775 "$pkgdir"/usr/bin
	install -Dm775 mdc "$pkgdir"/usr/bin
	install -Dm775 iconv "$pkgdir"/usr/bin/cider-iconv
	install -Dm775 sstasm "$pkgdir"/usr/bin
	install -Dm775 mdc "$pkgdir"/usr/bin
	install -Dm775 packddd "$pkgdir"/usr/bin
	install -Dm775 makedisk "$pkgdir"/usr/bin
	install -Dm775 getfile "$pkgdir"/usr/bin
}
