# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=mash
pkgver=2.3
pkgrel=1
pkgdesc="Fast genome and metagenome distance estimation using MinHash"
url="https://github.com/marbl/Mash/"
license=("BSD")
arch=("x86_64")
makedepends=("capnproto")
source=("https://github.com/marbl/Mash/archive/v${pkgver}.tar.gz"
		"dynamic-capnp.patch")
sha256sums=('f96cf7305e010012c3debed966ac83ceecac0351dbbfeaa6cd7ad7f068d87fe1'
            '61cd860e66e57f6cc3dac317cb19665263aaa1de9b8c487cb9133ccde2388d92')

prepare() {
	cd "Mash-${pkgver}"
	patch -R -p1 -i ../../dynamic-capnp.patch
}

check() {
	cd "Mash-${pkgver}"
	make test
}

build() {
	cd "Mash-${pkgver}"
	autoconf
	./configure --prefix="${pkgdir}/usr" --with-capnp=/usr
	make
}

package() {
	cd "Mash-${pkgver}"
	make install
}
