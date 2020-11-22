# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_repouser=arkadi
_reponame=asterisk-g72x
_rev=3855cec2ef2667f3e9224006dbaf179575752218
_shortrev=${_rev:0:12}
pkgname=asterisk-g729-odbc-mysql
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=0
pkgver=1.4.3.r4.${_shortrev}
pkgrel=1
arch=(x86_64)
url="http://asterisk.hosting.lv/"
license=(IPP)
depends=('asterisk-odbc-mysql' 'bcg729')
source=("${_reponame}-${pkgver}.tar.bz2"::"https://bitbucket.org/${_repouser}/${_reponame}/get/${_rev}.tar.bz2")
sha256sums=('25f46b332bec3dfb51e7a44dcfb3b0aa04cdf2fd50caea44f0eeca4e1c83a9b0')

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

