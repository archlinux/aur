# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=bmfdec-git
pkgver=r49.abb99dc
pkgrel=1
pkgdesc='Decompile binary MOF file (BMF) from WMI buffer (git master)'
arch=(x86_64)
url=https://github.com/pali/bmfdec
license=(GPL2)
depends=(glibc)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C ${pkgname%-git}
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname%-git}/bmf{2mof,dec,parse}
}
