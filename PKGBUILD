# Maintainer: fwhcat <fabien.wang@gmail.com>

_pkgname=windows10-icon-theme
pkgname=${_pkgname}-git
pkgver=r14.9f199c6
pkgrel=1
pkgdesc="Windows 10 icon theme"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-10"
license=('GPL3')

makedepends=('git')

provides=("${_pkgname}-git")
conflicts=("${_pkgname}-git")

source=("${_pkgname}::git+https://github.com/B00merang-Artwork/Windows-10.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	cd "${srcdir}/${_pkgname}"
	install -d -m 755 "$pkgdir/usr/share/icons/Windows10"

	cp -a * "$pkgdir/usr/share/icons/Windows10"
	rm -rf "$pkgdir/.git/*"
	rm -f "$pkgdir/usr/share/icons/Windows10/README.md"
	find "$pkgdir/usr/share/icons/Windows10" -type f -exec chmod 644 {} +
	find "$pkgdir/usr/share/icons/Windows10" -type l -exec chmod -c 644 {} +
}
