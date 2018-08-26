# Maintainer: Viech <viech unvanquished net>

pkgname=crunch-unv-git
pkgver=daemon.17.g95415e8
pkgrel=1
pkgdesc='DXTn texture compression tool. Modified version from Unvanquished Development.'
arch=('x86_64' 'i686')
url='https://github.com/DaemonEngine/crunch'
license=('ZLIB')
makedepends=('git')
depends=('glibc')
source=("crunch::git+https://github.com/DaemonEngine/crunch.git")

pkgver() {
	cd "${srcdir}/crunch/"
	local ver="$(git describe --tags --long)"
	printf "%s" "${ver//-/.}"
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

md5sums=('SKIP')
