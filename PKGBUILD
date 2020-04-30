# Maintainer: Pablo Lenna  <pablolenna@gmail.com>

pkgname=bootsplash-manjaro-splash
pkgver=r3.fb988d5
pkgrel=1
pkgdesc="Bootsplash Theme 'Manjaro Splash'"
arch=('any')
url="https://github.com/githubgeeker/bootsplash-manjaro-splash"
license=('GPL')
makedepends=('coreutils')
builddepends=('imagemagick')
options=(
	'!libtool'
	'!emptydirs'
)
source=("git+https://github.com/githubgeeker/bootsplash-manjaro-splash.git")
md5sums=('SKIP')


prepare()
{
	cd "$srcdir/$pkgname"
	git checkout master
}
build() {
	cd "$srcdir/$pkgname"
	sh ./bootsplash-manjaro-splash.sh
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
	install -Dm644 "bootsplash-manjaro-splash" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-splash/bootsplash"
	install -Dm644 "bootsplash-manjaro-splash.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-splash"
}
