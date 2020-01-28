# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_repouser=arkadi
_reponame=asterisk-g72x
_rev=cfc2eb7bce734a90700197c3e9d61e5cc4cc8ff5
_shortrev=${_rev:0:12}
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.3.r2.${_shortrev}
pkgrel=3
arch=(x86_64)
url="http://asterisk.hosting.lv/"
license=(IPP)
depends=(asterisk bcg729)
source=("${_reponame}-${pkgver}.tar.bz2"::"https://bitbucket.org/${_repouser}/${_reponame}/get/${_rev}.tar.bz2")
sha256sums=('0951cdcc6144908ebc52f8a596c6d2ad8cb35aa7eff51bf264b97003d73d3737')

build() {
	cd "${_repouser}-${_reponame}-${_shortrev}"

	./autogen.sh
	./configure \
		--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
		--with-bcg729 --with-asterisk160

	make -j$(nproc)
}

package() {
	cd "${_repouser}-${_reponame}-${_shortrev}"

	make DESTDIR="${pkgdir}" install
}

