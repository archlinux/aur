# Maintainer: Stephen Brennan <smb196@case.edu>
# Contributor: Arvedui <arvedui@posteo.de>
pkgname=libcommuni
pkgver=3.6.0
pkgrel=1
pkgdesc="A cross-platform IRC framework written with Qt."
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://communi.github.io/"
license=('BSD')
depends=('qt5-declarative')
makedepends=('chrpath')
source=("libcommuni-v$pkgver.tar.gz::https://github.com/communi/$pkgname/archive/v$pkgver.tar.gz")
md5sums=(34d7a865ecac8d444ee2433491df5634)

build() {
	cd "$pkgname-$pkgver"
        qmake
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname}/"
	install -m644 LICENSE \
		"$pkgdir/usr/share/licenses/${pkgname}/"

	chrpath -d "${pkgdir}/usr/lib/libIrc"{Model,Util}".so.${pkgver}"
	chrpath -d "${pkgdir}/usr/lib/qt/qml/Communi/libcommuniplugin.so"
}
