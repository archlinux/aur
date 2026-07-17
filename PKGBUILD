# Maintainer: Max Jeschek <max@jeschek.dev>
# Template: CI substitutes 0.1.1 / 7b1d716dc40959dc1fd45ab0d7ceb815034934792dfcee13945a50f4055e9eb9 (.github/workflows/release.yml).
pkgname=flurfunk-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Self-hosted team chat with encrypted voice calls — client and server"
arch=('x86_64')
url="https://github.com/maxischmaxi/flurfunk"
license=('MIT')
# Audio libs (opus, rnnoise, speexdsp) are statically linked.
depends=('glibc' 'libx11')
provides=('flurfunk')
conflicts=('flurfunk')
source=("https://github.com/maxischmaxi/flurfunk/releases/download/v${pkgver}/flurfunk-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('7b1d716dc40959dc1fd45ab0d7ceb815034934792dfcee13945a50f4055e9eb9')

package() {
	cd "flurfunk-${pkgver}-linux-x86_64"
	install -Dm755 flurfunk "$pkgdir/usr/bin/flurfunk"
	install -Dm755 flurfunk-server "$pkgdir/usr/bin/flurfunk-server"
	install -Dm644 flurfunk.desktop "$pkgdir/usr/share/applications/flurfunk.desktop"
	for size in 16 32 48 64 128 256 512; do
		install -Dm644 "icons/flurfunk-${size}.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/flurfunk.png"
	done
	install -Dm644 icons/flurfunk.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/flurfunk.svg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
