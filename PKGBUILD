# Maintainer: Pablo Lenna  <pablolenna@gmail.com>

pkgname=bootsplash-manjaro-grey
_pkgname=bootsplash-manjaro-grey
pkgver=0.1
pkgrel=1
pkgdesc="Bootsplash Theme 'Manjaro Grey'"
arch=('any')
url="https://github.com/githubgeeker/bootsplash-manjaro-grey"
license=('GPL')
makedepends=('coreutils''git')
builddepends=('imagemagick')
options=(
	'!libtool'
	'!emptydirs'
)
source=("git+https://github.com/githubgeeker/bootsplash-manjaro-grey.git")
md5sums=('SKIP')


prepare()
{
	cd "${_pkgname}"
	git checkout master
}
build() {
	cd "${_pkgname}"
	sh ./bootsplash-manjaro-grey.sh
}
pkgver()
{
	cd "${_pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}
package() {
	cd "${_pkgname}"
	install -Dm644 "bootsplash-manjaro-grey" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-grey/bootsplash"
	install -Dm644 "bootsplash-manjaro-grey.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-grey"
}
