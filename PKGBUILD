# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_repouser=arkadi
_reponame=asterisk-g72x
_rev=3058c45eb60de96e77fec4d168572fd6b9954d7c
_shortrev=${_rev:0:12}
pkgname=asterisk-g729
pkgdesc="G.729 codec for Asterisk open source PBX"
epoch=1
pkgver=1.4.2.r2.${_shortrev}
pkgrel=1
arch=(x86_64)
url="http://asterisk.hosting.lv/"
license=(IPP)
depends=(asterisk bcg729)
source=("${_reponame}-${pkgver}.tar.bz2"::"https://bitbucket.org/${_repouser}/${_reponame}/get/${_rev}.tar.bz2"
		"fixes-16.0.0.diff")
sha256sums=('81954ec0e4cce2dbe1abb3f3ec74d6ccfb4b087233442a81811029bc64a27987'
            'd6a30dfa448b389c0015385a6a7a4f5e3a649a0ceda40f1aafca48bf54a310ee')

prepare() {
	cd "${_repouser}-${_reponame}-${_shortrev}"

	patch -Np1 <../fixes-16.0.0.diff
}

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

