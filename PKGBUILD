# Maintainer: Gamma <GammaFunction@vivaldi.net>
pkgname=acolor-git
pkgver=0.1
pkgrel=3
license=('ISC')
pkgdesc='An extensible command colorizer with community scripts'
url='https://github.com/xPMo/acolor'
arch=('any')
provides=('acolor')
conflicts=('acolor')
depends=('gawk' 'bash' 'sed')
optdepends=('expect: unbuffer to fake tty')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	PREFIX="${pkgdir}/usr" make install
}
