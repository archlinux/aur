# Maintainer: LinArcX <LinArcX at gmail dot com>

pkgname=sirfiliams-git
pkgver=r5.d881b71
pkgrel=1
pkgdesc="Show Information About Tv Show's, Ratings And So Many Cool Fatures!"
arch=('any')
url="http://www.stack.blog.ir"
license=('GPL3')
depends=('python' 'tvdb_api-git')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/LinArcX/sirfiliams")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
        ( set -o pipefail
          git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d ${pkgdir}/usr/share/sirfiliams
	cp -a ./sirfiliams.py  ${pkgdir}/usr/share/sirfiliams
    #make DESTDIR="$pkgdir/" install
}
