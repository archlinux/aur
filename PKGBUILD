# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('flatery-icon-theme-git')
pkgver=r72.a38b3ee
pkgrel=2
pkgdesc="Flatery is an icon theme for linux in flat style"
arch=('any')
url="https://github.com/cbrnix/Flatery"
license=('CC BY-NC-SA 3.0')
makedepends=('git')
source=("git+$url")
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Flatery"
  ( 
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/Flatery/Flatery"
 	rm .directory
 	rm *.md
 	rm *.png
 	rm *.pdf
 	cd "$srcdir/Flatery/Flatery-Dark"
 	rm .directory
 	rm *.md
 	rm *.pdf
}

package() {
	cd "$srcdir/Flatery/Flatery"
	install -dm 755 "$pkgdir/usr/share/icons/Flatery"
	cp -drf --no-preserve='ownership' * "$pkgdir/usr/share/icons/Flatery"

	cd "$srcdir/Flatery/Flatery-Dark"
	install -dm 755 "$pkgdir/usr/share/icons/Flatery-Dark"
	cp -drf --no-preserve='ownership' * "$pkgdir/usr/share/icons/Flatery-Dark"
}
# vim:set ts=2 sw=2 et:
