pkgname=pandoc-crossref-bin
pkgver=0.3.3.0
_pandoc_pkgver=23
_ghc_pkgver=84
pkgrel=1
pkgdesc="Pandoc Cross References - executable only, without 750MB Haskell depends/makedepends"
url="https://hackage.haskell.org/package/pandoc-crossref"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("pandoc-crossref")
replaces=('pandoc-crossref-static' 'pandoc-crossref-lite')
depends=('pandoc')

source=(
    "pandoc-crossref-${pkgver}-ghc${_ghc_pkgver}.tar.gz::https://github.com/lierdakil/pandoc-crossref/releases/download/v${pkgver}/linux-ghc${_ghc_pkgver}-pandoc${_pandoc_pkgver}.tar.gz"
)
sha256sums=('a65a94c15ab3003e9fe90300b523c4213b3e57875295d3da8ad8c3549ad6b88c')

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "pandoc-crossref-${pkgver}-ghc${_ghc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"
}
