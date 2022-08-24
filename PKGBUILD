# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>

_hackage_name=weeder
pkgname="haskell-${_hackage_name}"
pkgver=2.4.0
pkgrel=1
pkgdesc="Detect dead exports or package imports"
arch=('x86_64')
url="https://github.com/ocharles/weeder"
license=('BSD')
makedepends=('git' 'cabal')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c2adbd741b0193a860defa51492e706e74672cdee62bb5db4663dd5cb634efe')

prepare() {
    cd "${srcdir}/${_hackage_name}-${pkgver}"
}

build() {
    echo "trying to use $(ghc --version)"
    cd "${srcdir}/${_hackage_name}-${pkgver}"

    cabal build -O2 -j
}

package() {
    cd "${srcdir}/${_hackage_name}-${pkgver}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cabal install exe:weeder --install-method=copy --installdir="${pkgdir}/usr/bin"
    # stack --local-bin-path "${pkgdir}/usr/bin/" install
}
