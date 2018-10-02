# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=linuxprivchecker-git
pkgver=r6.e048a31
pkgrel=1
pkgdesc='A Linux privilege escalation check script'
arch=('any')
url='https://github.com/sleventyeleven/linuxprivchecker'
license=('custom')
depends=('python2')
makedepends=('git')
provides=("${pkgname%-git}")
install=
source=("${pkgname%-git}::git+https://github.com/sleventyeleven/linuxprivchecker.git"
		shebang.patch{,.sig})
sha256sums=('SKIP'
			'55d23942e109e1352a51dac0263c728a33b73523b2519b8836b6556b64c56d2d'
			'SKIP')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	tail -12 README.md >LICENSE
	patch "${pkgname%-git}.py" ../shebang.patch
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 "${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm 644 'LICENSE' "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm 644 'README.md' "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
