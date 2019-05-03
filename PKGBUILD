# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows10-icons-git
pkgver=r5.7cf4204
pkgrel=1
pkgdesc="Icons to emulate a Windows 10 look"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-10"
license=('GPL')
conflicts=('windows10-icons')
provides=('windows10-icons')
makedepends=('git')
source=("${pkgname}::git+git://github.com/B00merang-Artwork/Windows-10.git")
sha1sums=('SKIP')

pkgver()
{
	cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	cd "$srcdir/$pkgname"

	install -d -m 755 "$pkgdir/usr/share/icons/Windows-10-Icons"

	cp -a * "$pkgdir/usr/share/icons/Windows-10-Icons"
	rm -rf "$pkgdir/.git/*"
	rm -f "$pkgdir/usr/share/icons/Windows-10-Icons/README.md"
	find "$pkgdir/usr/share/icons/Windows-10-Icons" -type f -exec chmod 644 {} + 
	find "$pkgdir/usr/share/icons/Windows-10-Icons" -type l -exec chmod -c 644 {} +
}
