# Maintainer: Viech <viech unvanquished net>

pkgname=crunch-unv-git
pkgver=0.52.0.r0.g9805bee
pkgrel=1
pkgdesc='DXTn texture compression tool. Modified version from Unvanquished Development.'
arch=('x86_64' 'i686')
url='https://github.com/DaemonEngine/crunch'
license=('ZLIB')
makedepends=('git')
depends=('glibc')
source=("crunch::git+https://github.com/DaemonEngine/crunch.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/crunch/"
	git describe --match 'unvanquished/*' --long \
		| sed 's/^unvanquished\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/crunch/crnlib"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/crunch"

	install -m755 "${srcdir}/crunch/crnlib/crunch" "${pkgdir}/usr/bin/crunch"
	install -m644 "${srcdir}/crunch/license.txt"   "${pkgdir}/usr/share/licenses/crunch/LICENSE"
}
