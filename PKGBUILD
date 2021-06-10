# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=joomscan-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --tags | sed 's:-:\+:g'; }
pkgver=0.0.7+38+g7931539
pkgrel=1

pkgdesc='OWASP Joomla! security scanner'
arch=('any')
url=https://www.owasp.org/index.php/Category:OWASP_Joomla_Vulnerability_Scanner_Project
license=('GPL3')

provides=("$_name")
conflicts=("$_name")

makedepends=('git')
depends=('perl')

changelog='CHANGELOG.md'
source=("git+https://github.com/rezasp/$_name")
sha256sums=('SKIP')


prepare() { find "$_name" -name '*.pl' -exec sed -i 's/\r$//' {} \;; }

package() {
	cd "$_name"
	install -Dm755 "$_name".pl -t"$pkgdir/usr/lib/$_name/"
	cp -a --no-preserve=o core exploit modules "$pkgdir/usr/lib/$_name/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/lib/$_name/$_name.pl" "$pkgdir/usr/bin/$_name"
	install -Dm644 {CHANGELOG,README}.md Dockerfile -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
