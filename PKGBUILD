# Maintainer: shaweel <shaweel@proton.com>
fetchMetadataValue() {
	curl -s https://raw.githubusercontent.com/shaweel/shaweelTimer/refs/heads/dev/metadata.json \
	| grep "$1" \
	| sed "s/.*\"$1\": \"\(.*\)\".*/\1/"
}

pkgname=shaweeltimer-dev
pkgdesc="dev branch of shaweeltimer (highly unstable)"
url=$(fetchMetadataValue "url")
pkgver=$(fetchMetadataValue "version")
pkgrel=1
arch=(any)
license=("GPL-3.0-or-later")
conflicts=("shaweeltimer")

depends=("python" "python-gobject" "gtk4" "libadwaita")

source=("$pkgname-$pkgver.tar.gz::https://github.com/shaweel/shaweelTimer/archive/refs/heads/dev.tar.gz")

sha256sums=('SKIP')

package() {
	cd "$srcdir/shaweelTimer-dev"

	install -Dm755 main.py "$pkgdir/usr/lib/shaweelTimer/main.py"
	install -Dm755 status.py "$pkgdir/usr/lib/shaweelTimer/status.py"
	install -Dm755 config.py "$pkgdir/usr/lib/shaweelTimer/config.py"
	install -Dm644 metadata.json "$pkgdir/usr/lib/shaweelTimer/metadata.json"
	install -Dm644 assets/shaweelTimer.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/shaweeltimer.png"
	./generateVersionData.sh "AUR" "1.2.0" "dev"
	install -Dm644 versionData.json "$pkgdir/usr/lib/shaweelTimer/versionData.json"
	install -Dm755 shaweeltimer "$pkgdir/usr/bin/shaweeltimer"
	install -Dm755 shaweelTimer.desktop "$pkgdir/usr/share/applications/shaweeltimer.desktop"
}