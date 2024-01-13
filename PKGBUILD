#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.22.3
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386"
        "${pkgname%-bin}-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
noextract=(${pkgname%-bin}-$pkgver.tar.gz)
sha256sums=('b6725e0eee0c09b01726d7986aa073ab4e4d445e56bb182bf55be9b9f1a3fa5a'
            '8134505c476b6265adcd34d3423cf60c69716c46c63a49e5600e77105c2ffb97')

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
