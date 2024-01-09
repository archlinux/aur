#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386"
        "${pkgname%-bin}-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
noextract=(${pkgname%-bin}-$pkgver.tar.gz)
sha256sums=('085b260e5e76f0a6552c159fa094e7953ae564de32bd7f41df60dcac6dccc948'
            'c7c6f2edf5569068e51656742cce373931798811ea6ab13f6db9659fc3f4fa76')

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
