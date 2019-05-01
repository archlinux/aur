# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgbasename=matrix-nio
pkgname=matrix-nio-git
pkgver=0.2.r52.g8c58392
pkgrel=1
pkgdesc="A Python Matrix client library, designed according to sans I/O "\
"principles"
url="https://github.com/poljar/matrix-nio"
arch=(any)
license=('custom:ISC')
depends=(
	'python'
)
makedepends=('tar' 'gzip' 'git')
source=("git://github.com/poljar/matrix-nio.git")
md5sums=('SKIP')
provides=('matrix-nio')
conflicts=('matrix-nio')

pkgver() {
	cd "${srcdir}/${pkgbasename}"
	(
		set -o pipefail
		git describe --long --tags 2> /dev/null |
			sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" \
				"$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${pkgbasename}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 "LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
