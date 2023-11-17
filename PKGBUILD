# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>

pkgname=merecat
pkgver=2.31
pkgrel=1
epoch=
pkgdesc="Small and made-easy HTTP/HTTPS server based on Jef Poskanzer's thttpd"
arch=(x86_64)
url="https://github.com/troglobit/merecat/"
license=(custom:2BSD)
groups=()
depends=()
makedepends=(confuse)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/troglobit/merecat/archive/refs/tags/v${pkgver}.tar.gz)
noextract=()
sha256sums=('af8aba4e4992987873efc323dcc4079962fd7ed0a89667007e0f0ca08f7a969e')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin --sysconfdir=/etc --localstatedir="/usr/share/${pkgname}"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# /usr/share/doc/${pkgname}/LICENSE
	# /usr/share/licenses/${pkgname}/LICENSE
	install -dm755 $pkgdir/usr/share/licenses/$pkgname
	ln -s ../../doc/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
