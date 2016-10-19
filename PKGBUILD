# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=xhtml2man-git
pkgver=r17.ad5c485
pkgrel=1
pkgdesc="XSLT to turn proper XHTML documents into man pages"
arch=(any)
url="https://github.com/jyujin/xhtml2man"
license=('MIT')
depends=('tidy' 'libxslt')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jyujin/xhtml2man.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D sh/html2man "$pkgdir/usr/bin/html2man"
	install -Dm644 xslt/xhtml2man.xslt "$pkgdir/usr/share/xhtml2man/xslt/xhtml2man.xslt"

	install -Dm644 documentation/html2man.1 "$pkgdir/usr/share/man/man1/html2man.1"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
