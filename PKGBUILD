# Maintainer: Pan Lanlan <abbypan@gmail.com>
pkgname=libsecp256k1-zkp-git
pkgver=0.0.0
pkgrel=1
pkgdesc='A fork of libsecp256k1 with support for advanced and experimental features such as Confidential Assets and MuSig2'
arch=('any')
license=('MIT')
makedepends=()
url="https://github.com/BlockstreamResearch/secp256k1-zkp/"

build() {
    git clone --recursive $url
    cd secp256k1-zkp
    ./autogen.sh
    ./configure --enable-experimental --enable-module-musig --enable-module-schnorrsig-halfagg --enable-module-rangeproof --enable-module-ecdsa-s2c --enable-module-bppp --enable-module-generator
    make
    make check
}

package() {
	cd secp256k1-zkp
    make install DESTDIR=$pkgdir
}
