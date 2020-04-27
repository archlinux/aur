# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>

pkgname=bootsplash-theme-manjaro-green-git
_pkgname=bootsplash-manjaro-green
pkgver=r5.a72c392
pkgrel=1
pkgdesc="Bootsplash Theme 'Manjaro green'"
arch=('any')
url="https://github.com/ahmubashshir/bootsplash-manjaro-green"
license=('GPL')
makedepends=('coreutils')
builddepends=('imagemagick')
options=(
	'!libtool'
	'!emptydirs'
)
source=("git+https://github.com/ahmubashshir/bootsplash-manjaro-green.git")
validpgpkeys=('916961EE198832DD70B628B356DB0538F60D951C')
md5sums=('SKIP')

prepare()
{
	cd "${_pkgname}"
	git checkout master
}
build() {
	cd "${_pkgname}"
	sh ./bootsplash-manjaro-green.sh
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
	install -Dm644 "bootsplash-manjaro-green" "$pkgdir/usr/lib/firmware/bootsplash-themes/manjaro-green/bootsplash"
	install -Dm644 "bootsplash-manjaro-green.initcpio_install" "$pkgdir/usr/lib/initcpio/install/bootsplash-manjaro-green"
}
