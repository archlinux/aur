# Maintainer: eNV25 <env252525@gmail.com>

pkgname=webtorrent-mpv-hook
pkgver=1.4.3
pkgrel=3
pkgdesc="script that allows mpv to stream torrents"
arch=(any)
url="https://github.com/mrxdst/webtorrent-mpv-hook"
license=('Unlicense')
depends=('nodejs>=20.10.0' 'mpv')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz" 'webtorrent-pr-2797.patch::https://github.com/webtorrent/webtorrent/pull/2797.patch')
noextract=("$pkgname-$pkgver.tgz")

package() {
	npm install --cache "$srcdir/npm-cache" -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
	patch -d "$pkgdir/usr/lib/node_modules/$pkgname/node_modules/webtorrent/" -p1 <'webtorrent-pr-2797.patch'
	mkdir -p "$pkgdir/etc/mpv/scripts/"
	ln -srvf "$pkgdir/usr/lib/node_modules/$pkgname/build/webtorrent.js" "$pkgdir/etc/mpv/scripts/webtorrent.js"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	ln -srvf "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('6b8d8f9df216036880b83c3dd7ca712001014b1400a8130082011e5cd1c0f5e2'
            '8cf267ea14b658ebf5dcf1c08956536dcd92fdd4b310e1288a9c020bd19f39f3')
