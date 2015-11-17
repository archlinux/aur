pkgname='doin-git'
pkgver=r7.5982079
pkgrel=1
depends=('glibc')
provides=('doin')
conflicts=('doin')
arch=('x86_64' 'i686')
url='https://github.com/aperezdc/doin'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
license=('MIT')

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
	make PREFIX=/usr
}

package () {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
