# Maintainer: Dimitris Kiziridis <ragouel@outlook.com>

pkgname=('flatery-icon-theme-git')
pkgver=0
pkgrel=1
pkgdesc="Flatery is an icon theme for linux in flat style."
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
	cd "$srcdir"/Flatery
	( 
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir"/Flatery
 	rm .directory
 	rm *.pdf
 	rm *.md
 	rm *.png
}

package() {
	msg2 "Installing ${pkgname%-*}...";
	cd "$srcdir"
	install -dm 755 "${pkgdir}"/usr/share/icons/;
	cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
}
