# Maintainer: Grant Moyer <grantmoyer@gmail.com>

pkgname=foundryvtt
pkgver=13.351
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
    '93b7563e2d4ede16d505eecb74ff11cb2835d14e8fc138db30954b20e3498412'
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
