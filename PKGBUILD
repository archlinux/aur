pkgname=whip-server
pkgver=5.0
pkgrel=1
pkgdesc="The InWorldz WHIP distributed asset server"
arch=(i686 x86_64)
url="https://github.com/InWorldz/$pkgname"
license=("Apache")
source=("https://github.com/InWorldz/$pkgname/archive/v$pkgver.tar.gz"
"$pkgname.service")
makedepends=(cmake boost)
depends=(boost-libs)
md5sums=('b42288ea80f18df5d9fe60c9217bef74'
         'c37ceb97e93659900f3666f349bf5001')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$pkgname-$pkgver \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	cd build
	install -Dm755 whip "$pkgdir/srv/inworldz/whip"
	cd ../$pkgname-$pkgver
	install -m644 whip.cfg.sample "$pkgdir/srv/inworldz/"
	chmod 777 "$pkgdir/srv/inworldz/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
