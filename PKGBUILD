# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy
pkgver=0.9.53
pkgrel=1
pkgdesc="Automatic screen brightness tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
optdepends=('plog: library for debug logging')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('6ed9cb909e1f9b6b1faa23c26c326e38b2fd056e6b80a17bfaaa6a76c95e4772'
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
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
