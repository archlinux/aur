# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=v0.4.r40.g29d2d51
pkgrel=1
pkgdesc="Best-Effort Extent-Same, a btrfs deduplicator daemon"
arch=('any')
url="https://github.com/Zygo/bees"
license=('GPL3')
depends=()
makedepends=('git' 'make' 'gcc' 'markdown')
source=("$pkgname"::'git://github.com/Zygo/bees.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname}
	make
}

package() {
	cd "${pkgname}"
	make install PREFIX="${pkgdir}"
	make install_scripts PREFIX="${pkgdir}"
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	mv -v ${pkgdir}/lib/systemd/system/beesd@.service ${pkgdir}/usr/lib/systemd/system/
	rm -rf ${pkgdir}/lib
}
