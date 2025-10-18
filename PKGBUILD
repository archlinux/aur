# Maintainer: Mia Sireneva <mia_sireneva@riseup.net>

pkgname=mediamtx-bin
pkgver=1.15.2
pkgrel=1
pkgdesc='Ready-to-use and zero-dependency real-time media server and media proxy that allows to publish, read, proxy, record and playback video and audio streams'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/bluenviron/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/${pkgname%-bin}.yml")

source=(
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
	"${pkgname%-bin}.service"
	"${pkgname%-bin}@.service"
)

source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_amd64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_armv7.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_arm64.tar.gz")

sha256sums=(
	'fbae4d196086e770a0a4f10ac03b1e4180517381bbc03d9acc16b6d4f7fe3a71'
	'22b549d42f74e18ba8ee054248a447fd406dabe77f280766588ece12e1846b5c'
	'7e3736dfad3141a3f263fb29a05885670961f07dfbdad8bdbb5de41e3433f3b0'
	'80442dadb22e57529b456c76bf33ac364cd022f134fc5290dc54a7e2f8378124'
)

sha256sums_x86_64=('8143486d886cc2d5c76f98d687cfb2ee6daf947fd45989c9322c0618057dcf5b')
sha256sums_armv7h=('627182d3cfd24693f17611f07bafbe95d47f5223cf39bd296d7d0f408a909fe9')
sha256sums_aarch64=('c9ad9ae5f93c1a84a3a52055f630687498b98566e735b5177ed604fefa7072b5')

package() {
	cd "$srcdir"

	install -dm755 "$pkgdir/etc/${pkgname%-bin}"

	install -Dm755 "$srcdir/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm600 "$srcdir/${pkgname%-bin}.yml" "$pkgdir/etc/${pkgname%-bin}/${pkgname%-bin}.yml"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "$srcdir/${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 "$srcdir/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
	install -Dm644 "$srcdir/${pkgname%-bin}@.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}@.service"
}
