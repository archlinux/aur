# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=cardano-sl
pkgver=1.1.1
_commit=aed0d925b06e0bd1278e26539c445274c52f4b67
pkgrel=1
pkgdesc='Cryptographic currency implementing Ouroboros PoS protocol'
arch=('x86_64')
url='https://github.com/input-output-hk/cardano-sl/'
license=('MIT')
depends=('gmp' 'openssl' 'rocksdb')
makedepends=('git' 'ncurses5-compat-libs' 'stack')
source=("git+https://github.com/input-output-hk/cardano-sl.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}

    stack build --ghc-build=tinfo6
}

package() {
    cd ${pkgname}

    stack install --ghc-build=tinfo6 --local-bin-path="${pkgdir}/usr/bin"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
