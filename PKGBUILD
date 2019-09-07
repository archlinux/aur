# Maintainer: robertfoster

pkgname=ton-lite-client
pkgver=1
pkgrel=1
pkgdesc="Telegram Open Network lite client"
arch=('i686' 'x86_64')
url="https://test.ton.org"
license=('LGPL')
depends=('openssl')
makedepends=('cmake' 'gperf')
install=$pkgname.install
source=("https://test.ton.org/ton-test-liteclient-full.tar.xz"
"https://test.ton.org/ton-lite-client-test1.config.json")

prepare() {
	if [ ! -d $srcdir/${pkgname##ton-}-build ]; then
		mkdir $srcdir/${pkgname##ton-}-build
	fi
}

build() {
	cd $srcdir/${pkgname##ton-}-build
	cmake -DCMAKE_INSTALL_PREFIX=/usr --build "$srcdir/${pkgname##ton-}"
}

package() {
	cd $srcdir/${pkgname##ton-}-build
	make DESTDIR="$pkgdir/" install
	mkdir $pkgdir/usr/bin
	rm -rf CMakeFiles
	for i in $(find . -executable -type f); do
		cp $i $pkgdir/usr/bin/
	done

	install -Dm644 $srcdir/ton-lite-client-test1.config.json $pkgdir/etc/ton-global.config
}

md5sums=('SKIP'
'SKIP')
