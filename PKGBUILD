# Maintainer: Kian Kasad <kian at kasad.com>
pkgname=s6-man-pages-git
pkgver=r232.f049bcc
pkgrel=1
pkgdesc='Manual pages for the s6 suite of software'
arch=('any')
url='https://github.com/flexibeast/s6-man-pages'
license=('ISC')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	for manual in *.1.in ; do
		install -Dm0644 "$manual" "$pkgdir/usr/share/man/man1/${manual%.in}"
	done
	for manual in *.7.in ; do
		install -Dm0644 "$manual" "$pkgdir/usr/share/man/man7/${manual%.in}"
	done
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
