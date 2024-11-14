# Maintainer: Kid <hi at xuann dot wang>

pkgname=replit-desktop-app
pkgver=1.0.14
pkgrel=1
pkgdesc='The collaborative browser based IDE'
arch=(x86_64)
url=https://replit.com/desktop
license=(custom)
depends=(
	electron
)
install=.install

source=(
	replit.deb::https://desktop.replit.com/download/deb
	replit
)
sha256sums=('04e2233d75a3f494bc0a3e15ec21119186c15c9f4df5bd5e5942a13d99165170'
            '9392ee9aced0cda3a50e00bc1fe40f75830388143254cbcb42929802b835d277')

package() {
	local usr="$pkgdir/usr"
	local lib="$usr/lib/replit"

	tar xf data.tar.zst -C "$pkgdir"

	find "$lib" -type f ! -name '*.asar' -exec rm {} \;
	rm -d "$lib/locales"
	rm -r "$usr/share/lintian"

	install -D replit -t "$usr/bin"
}
