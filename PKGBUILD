pkgname=pandoc-crossref-bin
pkgver=0.3.0.1
pandoc_pkgver=20
ghc_pkgver=82
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
    "https://github.com/lierdakil/pandoc-crossref/releases/download/v${pkgver}/linux-ghc${ghc_pkgver}-pandoc${pandoc_pkgver}.tar.gz"
)
sha256sums=(
    "2b2faead48f05699336690f7a82a1926c64893019d16139091c6ea2cb4d6a0f0"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "linux-ghc${ghc_pkgver}-pandoc${pandoc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"

}
