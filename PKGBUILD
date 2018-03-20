pkgname=pandoc-crossref-bin
pkgver=0.3.0.2
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
    "c007071bcc1da610abd3b7d0b72b6a1b9e0e14d4ae2cdbb13e5816092b142152"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "linux-ghc${_ghc_pkgver}-pandoc${_pandoc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"
}
