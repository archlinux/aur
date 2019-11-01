# Maintainer: Dimitris Kiziridis <ragouel@outlook.com>

pkgname=('kuyen-icon-theme-git')
pkgver=r7.6ae6611
pkgrel=1
pkgdesc="A colourful flat theme designed for Plasma desktop."
arch=('any')
url="https://www.opencode.net/fabianalexis/kuyen-icons"
license=('CC BY-NC-SA 3.0')
makedepends=('git')
source=("git+$url")
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/kuyen-icons
	( 
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir"/kuyen-icons
 	rm *.md
}

package() {
	msg2 "Installing ${pkgname%-*}...";
	cd "$srcdir"
	install -dm 755 "${pkgdir}"/usr/share/icons/;
	cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
}
