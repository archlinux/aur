pkgname=pandoc-crossref-bin
pkgver=0.3.4.0a
_pandoc_pkgver=25
_ghc_pkgver=86
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
sha256sums=('0f12c21cf08677a20a9d73f7550edb93c56ba66a34b3a5d07470a5622d644f4c')

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "pandoc-crossref-${pkgver}-ghc${_ghc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"
}
