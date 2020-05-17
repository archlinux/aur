# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=linuxprivchecker-git

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r12.3f4fe96
pkgrel=1

pkgdesc='A Linux privilege escalation check script'
arch=('any')
url="https://github.com/sleventyeleven/${pkgname%-git}"
license=('custom')

makedepends=('git')
depends=('python2')

provides=("${pkgname%-git}")

source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
	cd "${pkgname%-git}"
	tail -12 README.md >LICENSE
	sed -i '1s|python|python2|' "${pkgname%-git}.py"
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 "${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
	install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
