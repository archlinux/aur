# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=77.5a3f1be
pkgrel=1
pkgdesc="Best-Effort Extent-Same, a btrfs deduplicator daemon"
arch=('any')
url="https://github.com/Zygo/bees"
license=('GPL3')
depends=()
makedepends=('git' 'make' 'gcc')
source=("$pkgname"::'git://github.com/Zygo/bees.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
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
