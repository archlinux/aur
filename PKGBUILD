pkgname=pandoc-crossref-bin
pkgver=0.3.2.0
_pandoc_pkgver=22
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
sha256sums=(
    "55e42496a73a7514cc150fa334f5c24c3ea3c6f73e51eed0878fc8c24b8ca237"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "pandoc-crossref-${pkgver}-ghc${_ghc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"
}
