# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gammy
pkgver=0.9.49
pkgrel=1
pkgdesc="Automatic screen brightness tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('4c8b441b802da3eccbe1692ae629c8c2742e9ca4dcab09cdc3fe4df4121f432c'
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
