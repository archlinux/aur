# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Initial PKGBUILD by: Maik Broemme <mbroemme@libmpq.org>
_origname="asterisk-g72x"
_dev="arkadi"
_rev="1a01e996d43b"
pkgname="asterisk-g729"
pkgdesc="G.729 codec for Asterisk open source PBX"
pkgver=1.4.1
pkgrel=1
arch=("i686" "x86_64")
url="http://asterisk.hosting.lv/"
license=("IPP")
depends=("asterisk" "bcg729")
source=("${_origname}-${pkgver}-${_rev}.tar.bz2"::"https://bitbucket.org/${_dev}/${_origname}/get/${_rev}.tar.bz2"
	"asterisk-15.diff")
sha256sums=('b00a26d0acbdbb9aac3f09a3a09f4310e55cb834cf2d271ffc7b4a0f636fd1e8'
            'cc18d4dabf762af0d64f459bcb6d4bdf19ff4a3022efa9e1620ba51b64895c48')

prepare() {
	cd "${srcdir}/${_dev}-${_origname}-${_rev}"

	patch -p1 <../asterisk-15.diff
}

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

