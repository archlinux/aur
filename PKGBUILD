# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>

_hackage_name=weeder
pkgname="haskell-${_hackage_name}"
pkgver=2.9.0
pkgrel=1
pkgdesc="Detect dead exports or package imports"
arch=('x86_64')
url="https://github.com/ocharles/weeder"
license=('BSD')
makedepends=('git' 'cabal-install')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('02d905109dfa1aaae009b03e4e6db7ff612aebd84debc305d3c48769e1eb9a9f')

prepare() {
    cd "${srcdir}/${_hackage_name}-${pkgver}"
}

build() {
    echo -e "###\n###     trying to use $(ghc --version)\n###"
    cd "${srcdir}/${_hackage_name}-${pkgver}"

    cabal build -O2 -j
}

package() {
    cd "${srcdir}/${_hackage_name}-${pkgver}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cabal install exe:weeder --install-method=copy --installdir="${pkgdir}/usr/bin"
    # stack --local-bin-path "${pkgdir}/usr/bin/" install
}
