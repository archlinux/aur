# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Initial PKGBUILD by: Maik Broemme <mbroemme@libmpq.org>
_origname="asterisk-g72x"
_dev="arkadi"
_rev="ea18845ad977"
pkgname="asterisk-g729"
pkgdesc="G.729 codec for Asterisk open source PBX"
pkgver=1.4
pkgrel=1
arch=("i686" "x86_64")
url="http://asterisk.hosting.lv/"
license=("IPP")
depends=("asterisk" "bcg729")
source=("${_origname}-${pkgver}-${_rev}.tar.bz2"::"https://bitbucket.org/${_dev}/${_origname}/get/${_rev}.tar.bz2")
sha256sums=('ebd2b5c8ecf2feb0f7d0c1556543e418e83154b5dfa7f9f377c2a1f4cd600d68')

build() {
	cd "${srcdir}/${_dev}-${_origname}-${_rev}"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --with-bcg729 --with-asterisk140

	make -j$(nproc)
}

package() {
	cd "${srcdir}/${_dev}-${_origname}-${_rev}"

	make DESTDIR=${pkgdir} install
}

