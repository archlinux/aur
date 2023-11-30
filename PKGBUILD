# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='TUI Mastodon client'
pkgname=nanotodon
pkgver=0.3.1
pkgrel=1
url=https://github.com/taka-tuos/nanotodon
license=(custom:MIT)
arch=(x86_64)
depends=(ncurses json-c curl)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b2e09d889e84ad8b98d7d0bd4821b0495e9667b2337777c81d9a28a150e1d30b073c149f7888e74391972617617542a1bdbc17db57fff2a9e671550a730daeb6')

build () {
	make -C "$pkgname-$pkgver" \
		LDFLAGS="$LDFLAGS" \
		CFLAGS="$CFLAGS -Wno-error=format-security"
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" nanotodon
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
