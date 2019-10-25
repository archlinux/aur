# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gammy
pkgver=0.9.51
pkgrel=1
pkgdesc="Automatic screen brightness tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('a03c08b8edcd4a58d0d5155c8da310cca58826ebc2a33cd7b9c55af5fbcc961e'
            'ad02735598429f55246969c58fe5ff54db7960e813996d6d642c08fb18687583')

build() {
	cd "$pkgname-$pkgver"
	qmake Gammy.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/gammy/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
}
