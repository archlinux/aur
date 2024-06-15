# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: Antoine Viallon <antoine@lesviallon.fr>

pkgname=starpu
pkgdesc='Task programming library for hybrid architectures'
url='https://starpu.gitlabpages.inria.fr/'
pkgver=1.3.11
pkgrel=2
arch=(x86_64 x86_64_v3)
license=('LGPL3')
depends=('blas' 'fxt' 'hwloc')
makedepends=()
source=(
    "starpu-$pkgver.tar.gz::https://files.inria.fr/starpu/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('580c6d98d49bacd2c666504c88890335d2689b6547d97f6a088d4ab4812df36e')

build() {
	cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --disable-build-doc \
        --disable-build-doc-pdf \
        --disable-build-examples \
        --disable-build-tests \
        --disable-cuda \
        --disable-fortran \
        --disable-mpi \
        --disable-opencl \
        --disable-socl \
        --disable-starpufft \
        --disable-starpupy \
        --enable-blas-lib=none \
        --enable-cpu \
        --enable-maxbuffers=16 \
        --with-pic \
        --with-fxt
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
