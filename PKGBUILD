#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.22.1
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386"
        "${pkgname%-bin}-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
noextract=(${pkgname%-bin}-$pkgver.tar.gz)
sha256sums=('47c25adb3c9b8049d6ea7b16d52bd7db574d6261f967407fa4bf203eb30436ac'
            'a35f00173ca56a8468082b917e742151fbeaeaeb4e86441879eec61076025f81')

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
