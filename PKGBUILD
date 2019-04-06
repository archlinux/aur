# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_repouser=arkadi
_reponame=asterisk-g72x
_rev=1710ea938ed0a818747c8d662a3ecef266d170ce
_shortrev=${_rev:0:12}
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.3.r1.${_shortrev}
pkgrel=1
arch=(x86_64)
url="http://asterisk.hosting.lv/"
license=(IPP)
depends=(asterisk bcg729)
source=("${_reponame}-${pkgver}.tar.bz2"::"https://bitbucket.org/${_repouser}/${_reponame}/get/${_rev}.tar.bz2")
sha256sums=('c3546f416451254ff37df255f3a9412c9fab189dc80b000f7c6c30caf5338e0b')

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

