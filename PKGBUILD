pkgname=unfs3
pkgver=0.9.22
pkgrel=3
pkgdesc="A user-space implementation of the NFSv3 server specification"
arch=('i686' 'x86_64')
url="http://unfs3.sourceforge.net/"
license=("BSD")
makedepends=("flex")
depends=('rpcbind')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz" "unfsd.conf" "unfsd" "unfsd.service")
md5sums=('ddf679a5d4d80096a59f3affc64f16e5' '7c28cd320ac4868cc6f0ca089fbf2e75' 'e1010b2da0d5fb962112eed243b2b5ed' '4dfcdd618b7b2229d9b6082401a52880')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	cd "$srcdir"
	install -Dm755 unfsd "$pkgdir/etc/rc.d/unfsd"
	install -Dm644 unfsd.conf "$pkgdir/etc/conf.d/unfsd.conf"
	install -Dm644 unfsd.service "$pkgdir/usr/lib/systemd/system/unfsd.service"
}


