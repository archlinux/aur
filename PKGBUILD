# Maintainer: Atle Solbakken <atle@goliathdns.no>
pkgname="rrr"
pkgver=1.12
pkgrel=1
pkgdesc="Read Route Record is a messaging daemon supporting HTTP, MQTT, TCP, UDP +++"
arch=('i686' 'arm64' 'x86_64')
url="https://www.github.com/atlesn/rrr"
license=('GPL')
depends=('python3' 'perl' 'mariadb-clients')
optdepends=('systemd: systemd daemon support')
makedepends=('git')
provides=('rrr')
source=("git+https://github.com/atlesn/$pkgname.git#branch=archlinux")
md5sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -i
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "${srcdir}/${pkgname}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/" install
}
