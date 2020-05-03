# Maintainer: Pablo Lenna  <pablolenna@gmail.com>

pkgname=bootsplash-manjaro-gnoman
pkgver=r4.1790706
pkgrel=1
pkgdesc="Bootsplash Theme Manjaro with gnome logo"
arch=('any')
url="https://github.com/githubgeeker/bootsplash-manjaro-gnoman"
license=('GPL')
makedepends=('coreutils')
builddepends=('imagemagick')
options=(
	'!libtool'
	'!emptydirs'
)
source=("git+https://github.com/githubgeeker/bootsplash-manjaro-gnoman.git")
sha256sums=('SKIP')

prepare()
{
	cd "$srcdir/$pkgname"
	git checkout master
}
build() {
	cd "$srcdir/$pkgname"
	sh ./bootsplash-manjaro-gnoman.sh
}
pkgver()
{
	cd "$srcdir/$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}
package() {
	cd "$srcdir/$pkgname"
	install -Dm644 "bootsplash-manjaro-gnoman" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-gnoman/bootsplash"
	install -Dm644 "bootsplash-manjaro-gnoman.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-gnoman"
}
