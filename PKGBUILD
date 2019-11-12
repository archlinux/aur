# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=cardano-sl
pkgver=3.1.0
_commit=1a792d7cd0f0c93a0f0c28f66372bce3c3808dbd
pkgrel=1
pkgdesc='Cryptographic currency implementing Ouroboros PoS protocol'
arch=('x86_64')
url='https://github.com/input-output-hk/cardano-sl/'
license=('MIT')
depends=('gmp' 'openssl' 'rocksdb')
makedepends=('git' 'stack')
source=("git+https://github.com/input-output-hk/cardano-sl.git#commit=${_commit}"
        'stack.patch')
sha256sums=('SKIP'
            '5a3930f42dc369cfcd993537bde79cf69e80e48a5aeaf599fd38371af614f2fa')

prepare() {
    cd ${pkgname}

    patch -Np1 -i ../stack.patch
}

build() {
    cd ${pkgname}

    stack build --ghc-build=tinfo6
}

package() {
    cd ${pkgname}

    stack install --ghc-build=tinfo6 --local-bin-path="${pkgdir}/usr/bin"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
