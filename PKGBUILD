# Maintainer: Pablo Lenna  <pablolenna@gmail.com>

pkgname=bootsplash-manjaro-globe
pkgver=1
pkgrel=1
pkgdesc="Bootsplash Theme Manjaro with globe spinner"
arch=('any')
url="https://github.com/githubgeeker/bootsplash-manjaro-globe"
license=('GPL')
makedepends=('coreutils')
builddepends=('imagemagick')
options=(
	'!libtool'
	'!emptydirs'
)
source=("git+https://github.com/githubgeeker/bootsplash-manjaro-globe.git")
md5sums=('SKIP')


prepare()
{
	cd "${_pkgname}"
	git checkout master
}
build() {
	cd "${_pkgname}"
	chmod u+x bootsplash-manjaro-globe.sh
	chmod u+x bootsplash-packer
	sh ./bootsplash-manjaro-globe.sh
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
	install -Dm644 "bootsplash-manjaro-globe" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-globe/bootsplash"
	install -Dm644 "bootsplash-manjaro-globe.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-globe"
}
