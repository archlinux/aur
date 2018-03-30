pkgname=pandoc-crossref-bin
pkgver=0.3.1.0
_pandoc_pkgver=21
_ghc_pkgver=82
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
    "https://github.com/lierdakil/pandoc-crossref/releases/download/v${pkgver}/linux-ghc${_ghc_pkgver}-pandoc${_pandoc_pkgver}.tar.gz"
)
sha256sums=(
    "a75707fe5b6e1150502abc56006495d831ce08c65f5a9dc088086fec890d4c43"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "linux-ghc${_ghc_pkgver}-pandoc${_pandoc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"
}
