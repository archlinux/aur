# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=mash
pkgver=2.2.2
pkgrel=2
pkgdesc="Fast genome and metagenome distance estimation using MinHash"
url="https://github.com/marbl/Mash/"
license=("BSD")
arch=("x86_64")
makedepends=("capnproto")
source=("https://github.com/marbl/Mash/archive/v${pkgver}.tar.gz"
		"dynamic-capnp.patch" "faster-revcomp.patch" "manpages.patch")
sha256sums=('e4c2d702fd0254f689256b2d8f7d3cc3a68db3ea45b60f0a662ce926a4f5fc22'
            '61cd860e66e57f6cc3dac317cb19665263aaa1de9b8c487cb9133ccde2388d92'
            'd363504438f8e6472063bb6ded7f43c8e895e2ca5de279aec01b19a82503b68b'
            'afd4263820301de7a2eeea3c8f5dbbce838834d34de8dbafffdd0f2c7624f7ae')

prepare() {
	cd "Mash-${pkgver}"
	patch -R -p1 -i ../../dynamic-capnp.patch
	patch -p1 -i ../../faster-revcomp.patch
	patch -p1 -i ../../manpages.patch
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
