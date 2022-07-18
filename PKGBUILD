pkgname='jmk-x11-fonts-git'
pkgdesc="Jim's Fonts for X"
pkgver=r5.29ae539
pkgrel=3
license=('GPL')
url='http://nikolas.us.to/jmkfonts/'
arch=('any')
source=("${pkgname}::git+https://github.com/nikolas/jmk-x11-fonts.git")
sha512sums=('SKIP')
makedepends=('imake' 'xorg-mkfontdir' 'xorg-bdftopcf' 'git')
conflicts=('jmk-x11-fonts')
provides=('jmk-x11-fonts')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	xmkmf
	make
}

package () {
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}"
}
