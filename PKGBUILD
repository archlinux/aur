pkgname=pandoc-crossref-bin
pkgver=0.3.4.1a
_pandoc_pkgver=2_7_3
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
    "pandoc-crossref-${pkgver}.tar.gz::https://github.com/lierdakil/pandoc-crossref/releases/download/v${pkgver}/linux-pandoc_${_pandoc_pkgver}.tar.gz"
)
sha256sums=('4b4abb27d6c54a0461e2c0e6d14eca7cb646bf9e10a59f3d2c8d5e7ed3583848')

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "pandoc-crossref-${pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-crossref "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/man/man1/"
    cp pandoc-crossref.1 "${pkgdir}/usr/share/man/man1/"
}
