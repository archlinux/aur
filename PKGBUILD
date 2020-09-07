# Maintainer: Atle Solbakken <atle@goliathdns.no>
pkgname="rrr"
pkgver=1.12
pkgrel=1
pkgdesc="RRR (Read Route Record) is a general purpose acquirement, transmission and processing daemon supporting HTTP, MQTT, TCP, UDP and other I/O devices. RRR has a variety of different modules which can be chained together to retrieve, transmit, modify and save messages."
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
