# Maintainer: Klaus Tachtler <klaus@tachtler.net>

pkgname=footermilter
_gitname=FooterMilter
pkgver=1.2.2
pkgrel=1
pkgdesc='FooterMilter insert a footer/disclaimer at the end of the body of an email'
arch=('any')
url="https://github.com/tachtler/FooterMilter.git"
license=('Apache-2.0')
depends=('java-runtime>=1.8')
backup=(etc/FooterMilter/footermilter.ini)
makedepends=('git')
source=("git+https://github.com/tachtler/FooterMilter.git")
sha256sums=('SKIP')

package() {
	cd "$_gitname"
	install -Dvm644 "FooterMilter.jar" "$pkgdir/opt/$_gitname/FooterMilter.jar"
  install -d "${pkgdir}/opt/$_gitname/lib"
  install -m644 "lib/"* "${pkgdir}/opt/$_gitname/lib/"
	install -Dvm644 "log4j2.xml" "$pkgdir/opt/$_gitname/log4j2.xml"
	install -Dvm644 "$pkgname.ini" "$pkgdir/etc/$_gitname/$pkgname.ini"
	install -Dvm644 README.md "$pkgdir/usr/share/doc/$_gitname/README.md"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname/"
	install -Dvm644 "doc/$_gitname.jar.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dvm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

	# make absolute just in case
	sed -i \
		-e 's/footermilter\.ini/\/etc\/FooterMilter\/footermilter\.ini/g' \
		"$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
