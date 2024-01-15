#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.23.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD-2-Clause-Views)
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386"
        "${pkgname%-bin}-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
noextract=(${pkgname%-bin}-$pkgver.tar.gz)
sha256sums=('65ee4780db604086e528cabfcca21b550e3a5d5e6f1046d204a7d713b6a6ef1d'
            '1b1731b65d5dd32324eca826efb6f762d79e51b7dae7bbfc8f0e5460f8d370ac')

prepare() {
	bsdtar -xvf ${pkgname%-bin}-$pkgver.tar.gz \
	${pkgname%-bin}-$pkgver/LICENSE \
	${pkgname%-bin}-$pkgver/${pkgname%-bin}.1 \
	${pkgname%-bin}-$pkgver/README.md
}

package() {
	install -Dm755 ${pkgname%-bin}-v$pkgver-linux-386 "$pkgdir/usr/bin/${pkgname%-bin}"
	cd "${pkgname%-bin}-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
	install -Dm644 ${pkgname%-bin}.1 "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
