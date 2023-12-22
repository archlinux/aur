# Maintainer: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>

pkgname=minimal-twitch-client
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal GTK stream viewer for youtube and twitch"
arch=('x86_64')
url='https://github.com/lowczarc/minimal-twitch-client'
license=('custom')
depends=(python3 python-vlc streamlink gtk3)
source=(
		"https://github.com/lowczarc/minimal-twitch-client/archive/refs/tags/v1.0.0.zip"
		"set-chat-key-to-f12.patch" 
		"use-source-file-path-to-asset.patch" 
		)

sha256sums=("b12f8829193c6da0cfd7ae605edcf8ed0c86ed0ce3162e7c5c2f95b0de9093d6" "SKIP" "SKIP")

prepare() {
	patch "$srcdir"/minimal-twitch-client-$pkgver/lib/app.py "$srcdir"/set-chat-key-to-f12.patch
	patch "$srcdir"/minimal-twitch-client-$pkgver/lib/app.py "$srcdir"/use-source-file-path-to-asset.patch
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	find lib/ assets/ -type f -exec install -Dm 644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
	install -Dm 755 stream_client "$pkgdir/usr/lib/$pkgname/stream_client"
	mkdir -p "$pkgdir"/usr/bin
	ln -s ../lib/$pkgname/stream_client "$pkgdir"/usr/bin/minimal-twitch-client
	ln -s ../lib/$pkgname/stream_client "$pkgdir"/usr/bin/twitch
}
