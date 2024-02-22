# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_rev=3855cec2ef2667f3e9224006dbaf179575752218
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.3.r5.${_rev:0:10}
pkgrel=1
arch=(x86_64)
url=http://asterisk.hosting.lv
license=(GPL-3.0-only)
depends=('asterisk<22.0.0' bcg729)
source=(https://github.com/arkadijs/asterisk-g72x/archive/${_rev}.tar.gz)
sha256sums=('b5830c002d1529f91c55c1513c8e9661287503203129cb68e219ddcb3a9d5a97')

build() {
	cd asterisk-g72x-${_rev}

	./autogen.sh
	./configure \
		--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
		--with-bcg729 --with-asterisk160

	make
}

package() {
	cd asterisk-g72x-${_rev}

	make DESTDIR="${pkgdir}" install
}
