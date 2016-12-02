# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=23.5a4ff9a
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
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/etc/bees

	install -Dm755 ${pkgname}/scripts/beesd				${pkgdir}/usr/bin/
	install -Dm755 ${pkgname}/bin/bees					${pkgdir}/usr/bin/
	install -Dm644 ${pkgname}/lib/libcrucible.so		${pkgdir}/usr/lib/
	install -Dm644 ${pkgname}/scripts/beesd.conf.sample ${pkgdir}/etc/bees/
	install -Dm644 ${pkgname}/scripts/beesd@.service	${pkgdir}/usr/lib/systemd/system/
}
