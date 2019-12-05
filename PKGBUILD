# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=mash
pkgver=2.2.2
pkgrel=1
pkgdesc="Fast genome and metagenome distance estimation using MinHash"
url="https://github.com/marbl/Mash/"
license=("BSD")
arch=("x86_64")
makedepends=("capnproto")
source=("https://github.com/marbl/Mash/archive/v${pkgver}.tar.gz" "dynamic-capnp.patch")
sha256sums=('e4c2d702fd0254f689256b2d8f7d3cc3a68db3ea45b60f0a662ce926a4f5fc22'
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
