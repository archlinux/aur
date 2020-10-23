# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_repouser=arkadi
_reponame=asterisk-g72x
_rev=f235e2b2f7abeaac305ee62280633cebe4e05f4b
_shortrev=${_rev:0:12}
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.3.r3.${_shortrev}
pkgrel=2
arch=(x86_64)
url="http://asterisk.hosting.lv/"
license=(IPP)
depends=('asterisk<19.0.0' 'bcg729')
source=("${_reponame}-${pkgver}.tar.bz2"::"https://bitbucket.org/${_repouser}/${_reponame}/get/${_rev}.tar.bz2")
sha256sums=('9b6e90f46e606ef09d3fae34bd1bebeba2c9aaa46c031edf48c8537d4211f63f')

build() {
	cd "${_repouser}-${_reponame}-${_shortrev}"

	./autogen.sh
	./configure \
		--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
		--with-bcg729 --with-asterisk160

	make
}

package() {
	cd "${_repouser}-${_reponame}-${_shortrev}"

	make DESTDIR="${pkgdir}" install
}

