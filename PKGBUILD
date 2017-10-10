# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Initial PKGBUILD by: Maik Broemme <mbroemme@libmpq.org>
_origname="asterisk-g72x"
_dev="arkadi"
_rev="3058c45eb60d"
pkgname="asterisk-g729"
pkgdesc="G.729 codec for Asterisk open source PBX"
pkgver=1.4.2
pkgrel=1
arch=("i686" "x86_64")
url="http://asterisk.hosting.lv/"
license=("IPP")
depends=("asterisk" "bcg729")
source=("${_origname}-${pkgver}-${_rev}.tar.bz2"::"https://bitbucket.org/${_dev}/${_origname}/get/${_rev}.tar.bz2")
sha256sums=('81954ec0e4cce2dbe1abb3f3ec74d6ccfb4b087233442a81811029bc64a27987')

build() {
	cd "${srcdir}/${_dev}-${_origname}-${_rev}"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --with-bcg729 --with-asterisk150

	make -j$(nproc)
}

package() {
	cd "${srcdir}/${_dev}-${_origname}-${_rev}"

	make DESTDIR=${pkgdir} install
}

