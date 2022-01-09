# Maintainer: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Contributer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=tcmu-runner
pkgver=1.5.4
pkgrel=2
pkgdesc="A daemon that handles the userspace side of the LIO TCM-User backstore."
arch=('x86_64')
url="https://github.com/open-iscsi/tcmu-runner"
license=('LGPL2.1')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/open-iscsi/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"

	cmake ./ \
		-Dwith-glfs=false \
		-Dwith-rbd=false \
		-Dwith-zbc=true \
		-Dwith-tcmalloc=false \
		-DSUPPORT_SYSTEMD=ON \
		-DCMAKE_INSTALL_PREFIX=/usr/ \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
