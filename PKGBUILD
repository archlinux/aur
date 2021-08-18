# Maintainer: Atle Solbakken <atle@goliathdns.no>
pkgname="rrr"
pkgver=1.19.0
pkgrel=0
pkgdesc="Read Route Record is a messaging daemon supporting HTTP, MQTT, TCP, UDP +++"
arch=('i686' 'arm64' 'x86_64' 'aarch64')
url="https://www.github.com/atlesn/rrr"
license=('GPL')
depends=('python3' 'perl' 'mariadb-clients' 'libnghttp2' 'json-c' 'libevent')
optdepends=('systemd: systemd daemon support')
makedepends=('git')
provides=('rrr')
source=("git+https://github.com/atlesn/$pkgname.git#tag=v1.19-0")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

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
