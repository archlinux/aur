# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=blink-bin
pkgver=1.7.4
pkgrel=1
pkgdesc='Instant code search tool'
arch=('x86_64')
url='https://github.com/ychclone/blink'
license=('GPL3')
provides=('blink-code-search')
conflicts=('blink')
options=('!strip')
source_x86_64=("$pkgname-$pkgver.AppImage::$url/releases/download/$pkgver/Blink-$CARCH.AppImage")
sha256sums_x86_64=('cd8d5a5a4e732dd1b79e0c4f74ff72297d68386b122d2c267aa7caabba84c53e')

prepare() {
	chmod +x "$pkgname-$pkgver.AppImage"
	./"$pkgname-$pkgver.AppImage" --appimage-extract &>/dev/null
}

package() {
	install -d \
		"$pkgdir/usr/bin" \
		"$pkgdir/usr/share/icons/hicolor/128x128/" \
		"$pkgdir/opt/$pkgname"
	cp -a --no-preserve=ownership squashfs-root/usr "$pkgdir/opt/$pkgname/"
	install -Dm644 squashfs-root/blink.desktop -t "$pkgdir/usr/share/applications/"
	ln -s "/opt/$pkgname/usr/bin/blink" "$pkgdir/usr/bin/"
	ln -s \
		"/opt/$pkgname/usr/share/icons/hicolor/128x128/blink.png" \
		"$pkgdir/usr/share/icons/hicolor/128x128/"
}
