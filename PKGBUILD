# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=gophrier
pkgver=0.2.3
pkgrel=1
pkgdesc="A Gopher server"
arch=('i686' 'x86_64')
url="http://gophrier.tuxfamily.org/"
license=('GPL2')
source=("http://download.tuxfamily.org/gophrier/gophrier-${pkgver}.tar.gz"
        'gophrier.service')
sha256sums=('90581c1f3abc8b3f1582adb4b553cd1b0e1edd398a864361d082455d8ad3cd00'
            'adee1e8c1a3c7fc91b2849c452fdc7a58ac26a9ee4dd7b6e4f375e87d08afa9d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/sbin/bin/' CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D --mode=0644 "$srcdir/gophrier.service" "$pkgdir/usr/lib/systemd/system/gophrier.service"
}
