# Maintainer: Michael Düll <michael.duell@rub.de>
# Contributor: Dalton Miller
pkgname=b2sum
pkgver=20150531
pkgrel=1
pkgdesc="Computes the BLAKE2 (BLAKE2b or -s, -bp, -sp) cryptographic hash of a given file. STDIN not supported (yet?)."
_prefix="blake2_code_"
arch=('i686' 'x86_64')
url="https://blake2.net/"
license=('custom')
source=("https://blake2.net/${_prefix}${pkgver}.zip")

prepare() {
	cd "${srcdir}/${_prefix}${pkgver}/b2sum"
    sed -i "s# -fopenmp##" makefile
    make clean
}

build() {
	cd "${srcdir}/${_prefix}${pkgver}/b2sum"
	make all
}

package() {
	cd "${srcdir}/${_prefix}${pkgver}/b2sum"
	install -d "${pkgdir}/usr/bin"
	install -Dm 755 b2sum "${pkgdir}/usr/bin"
}
sha384sums=('14dad3b898c69ee0891bf72a970ca331dd121940a16780a5ec72e789d4bcf239299e36091dfb357c5aba10bf57c3cbd6')
