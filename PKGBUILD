# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_rev=5024cb422cf58dbf0ae6e00f18092680e33391de
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.4.r2.${_rev:0:10}
pkgrel=1
arch=(x86_64)
url=http://asterisk.hosting.lv
license=(GPL-3.0-only)
depends=('asterisk<24.0.0' bcg729)
source=(https://github.com/arkadijs/asterisk-g72x/archive/${_rev}.tar.gz)
sha256sums=('4b5345b2325f57859e118e1d8fc8387639eefa79494c809888714597fcf5e507')

prepare() {
	cd asterisk-g72x-${_rev}

	autoreconf -fiv
}

build() {
	cd asterisk-g72x-${_rev}

	./configure \
		--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
		--with-bcg729 --with-asterisk160

	make
}

package() {
	cd asterisk-g72x-${_rev}

	make DESTDIR="${pkgdir}" install
}
