# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=nsfminer-cuda
_pkgname=nsfminer
pkgver=1.3.14
pkgrel=1
pkgdesc='No Fee Ethash miner for AMD and Nvidia'
url='https://github.com/no-fee-ethereum-mining/nsfminer'
license=('GPL3')
arch=('x86_64')
depends=('cuda' 'opencl-mesa' 'mesa' 'ethash-lib')
makedepends=('cmake')
conflicts=('ethminer-cuda' 'nsfminer-cuda-opencl')
provides=('nsfminer')
source=(https://github.com/no-fee-ethereum-mining/$_pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ca6452cb28f8f97b3648b34eb9375bdc48716c04374ec8ecc40377eb0af9096a')
        
build() {
    cmake \
        -B "$_pkgname-$pkgver"/build \
        -S "$_pkgname-$pkgver" \
        -DAPICORE:BOOL='OFF' \
        -DBINKERN:BOOL='ON' \
        -DETHASHCL:BOOL='ON' \
        -DETHASHCPU:BOOL='OFF' \
        -DETHASHCUDA:BOOL='ON' \
        -DETHDBUS:BOOL='OFF' \
        -DHUNTER_ENABLED:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C "$_pkgname-$pkgver"/build
}

package() {
    make -C $_pkgname-$pkgver/build DESTDIR="$pkgdir" install
}
