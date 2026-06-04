# Maintainer: Grant Moyer <grantmoyer@gmail.com>

pkgname=foundryvtt
pkgver=14.363
pkgrel=1
pkgdesc="A self-hosted, modern, and developer-friendly roleplaying platform"
arch=('x86_64')
url="https://foundryvtt.com/"
license=('custom')
options=(!strip)
# FoundryVTT archive must be downloaded from https://foundryvtt.com/me/licenses
source=(
	"FoundryVTT-Linux-$pkgver.zip::foundryvtt://FoundryVTT-Linux-$pkgver.zip"
	"foundryvtt.desktop"
)
sha256sums=(
	'72d7858d6e9d1afbf1958b0a6314a33f96ef2cdc5d4baa6cb08a0e2ed035a39b'
	'eb6d09ea176748a0e9b3a0ebb2aa3f2bca23e5f082ed676edd9fd8bf6b0ebbcb'
)
DLAGENTS+=("foundryvtt::/usr/bin/sh -c printf\ '%s\\\\n'\
	'%o\ must\ be\ downloaded\ from\ https://foundryvtt.com/me/licenses.'\
	'See\ comment\ in\ ./download_foundry.bash\ for\ automatic\ download.'\
	&&\ exit\ 1")

package() {
	install -m755 -d "$pkgdir/opt/$pkgname"
	install -m755 -d "$pkgdir/usr/bin"
	install -m644 -D -t "$pkgdir/usr/share/licenses/$pkgname/" "resources/app/license.html"
	install -m644 -D -t "$pkgdir/usr/share/applications/" "foundryvtt.desktop"
	cp -r * "$pkgdir/opt/$pkgname"
	rm "$pkgdir/opt/$pkgname/${source[0]/::*/}"
	ln -s "/opt/$pkgname/foundryvtt" "$pkgdir/usr/bin/foundryvtt"
}
