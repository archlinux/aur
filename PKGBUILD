#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.23.5
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD-2-Clause-Views)
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386"
        "${pkgname%-bin}-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
noextract=(${pkgname%-bin}-$pkgver.tar.gz)
sha256sums=('be51ff34060e00f4c2044864d51a982e7ad963e05d59a48fba3752b3f6e33d31'
            'f3c1c88545afde91d685943db20be1ae003b15c855faed9db61377f2dc768f4f')

prepare() {
	bsdtar -xvf ${pkgname%-bin}-$pkgver.tar.gz \
	${pkgname%-bin}-$pkgver/LICENSE \
	${pkgname%-bin}-$pkgver/${pkgname%-bin}.1 \
	${pkgname%-bin}-$pkgver/README.md
}

package() {
	install -Dm755 ${pkgname%-bin}-v$pkgver-linux-386 "${pkgdir}/usr/bin/${pkgname%-bin}"
	cd "${pkgname%-bin}-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 ${pkgname%-bin}.1 "${pkgdir}/usr/share/man/man1/${pkgname%-bin}.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
