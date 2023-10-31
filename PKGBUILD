# Maintainer: Mia Sireneva <mia_sireneva@riseup.net>

pkgname=mediamtx-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Also known as rtsp-simple-server. Ready-to-use RTSP / RTMP / LL-HLS / WebRTC server and proxy that allows to read, publish and proxy video and audio streams'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/aler9/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/${pkgname%-bin}.yml")

source=(
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
	"${pkgname%-bin}.service"
)

source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_amd64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_armv7.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${pkgname%-bin}_v${pkgver}_linux_arm64v8.tar.gz")

sha256sums=(
	'fbae4d196086e770a0a4f10ac03b1e4180517381bbc03d9acc16b6d4f7fe3a71'
	'22b549d42f74e18ba8ee054248a447fd406dabe77f280766588ece12e1846b5c'
	'7e3736dfad3141a3f263fb29a05885670961f07dfbdad8bdbb5de41e3433f3b0'
)

sha256sums_x86_64=('e6e5c342447f1fc4f537fb12911435fa933a2fe3efe5184ef96a5e0a28de0130')
sha256sums_armv7h=('a85557adb55c0b98c59642141c3b3bfb064dc60ad8bba3a8e944a9d8c8b712cf')
sha256sums_aarch64=('aaec51def76b327efd9e9f298d196b828064ee1c1260bbd883db02e6588589b5')

package() {
	cd "$srcdir"

	install -dm755 "$pkgdir/etc/${pkgname%-bin}"

	install -Dm755 "$srcdir/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm600 "$srcdir/${pkgname%-bin}.yml" "$pkgdir/etc/${pkgname%-bin}/${pkgname%-bin}.yml"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "$srcdir/${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	install -Dm644 "$srcdir/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
}
