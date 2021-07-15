# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=wey-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Fast open source Slack desktop app"
arch=('x86_64')
url="https://github.com/yue/wey"
license=('MIT')
depends=('webkit2gtk')
optdepends=('libappindicator-gtk3: for tray icon')
provides=('wey')
conflicts=('wey')
install=wey.install
source=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/wey-v${pkgver}-linux-x64.zip"
        'wey.desktop')
sha256sums=('f097b3b6f07e13445ffb8833a1754b5b43f6dd53b257a7bb8226a837ac30f77c'
            '83d1990554d42aac8a10c456627ce7c41021737e42a3e144aad8ee17ea01be1f')
options=(!strip)

package() {
	find res -type f -exec install -Dm644 -T '{}' "$pkgdir/opt/wey/{}" \;
	install -Dm755 wey -t "$pkgdir/opt/wey/"

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/wey/wey "$pkgdir/usr/bin/"

	install -Dm644 wey.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
