# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_rev=19103066c460de6cb2d8257c558401607a9d7208
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.4.r1.${_rev:0:10}
pkgrel=1
arch=(x86_64)
url=http://asterisk.hosting.lv
license=(GPL-3.0-only)
depends=('asterisk<23.0.0' bcg729)
source=(https://github.com/arkadijs/asterisk-g72x/archive/${_rev}.tar.gz)
sha256sums=('d710634fc374a7b49283178a9c487989d43b6cfec8861a632fd21d799c09d747')

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
