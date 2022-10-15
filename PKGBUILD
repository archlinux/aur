# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=unipicker
pkgver=2.0.1
pkgrel=1
pkgdesc='CLI utility for searching unicode characters by description and copy them to the clipboard'
arch=('any')
url="https://github.com/jeremija/$pkgname"
license=('MIT')
depends=('bash')
makedepends=('python')
optdepends=('fzf: selector command'
            'xclip: for copying to clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6b35e1b79a7a75ae3f1431eec702843efe68cd99b6c6069466b1c6489f6acb93e1b42ce4dc036d52bb68e915399754a8a69a73c409e4a0db40a2249da06940a2')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i -E 's|/usr/local/share|/usr/share|' unipickerrc
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install PREFIX="$pkgdir/usr"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
