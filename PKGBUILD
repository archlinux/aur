pkgname=pandoc-include-code-bin
pkgver=1.2.0.1
pandoc_pkgver=1-19
pkgrel=1
pkgdesc="A Pandoc filter for including code from source files - executable only, without 750MB Haskell depends/makedepends"
url="https://hackage.haskell.org/package/pandoc-include-code"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-include-code")
provides=("pandoc-include-code")
replaces=('pandoc-include-code-static' 'pandoc-include-code-lite')
depends=('pandoc')

source=(
    "https://github.com/owickstrom/pandoc-include-code/releases/download/v${pkgver}/pandoc-include-code-linux-ghc8-pandoc-${pandoc_pkgver}.tar.gz"
)
sha256sums=(
    "9e1c80271c3db2081dc790de3df8bd4c313ce094a1e9e8adc1ae02633e9161e3"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf "pandoc-include-code-linux-ghc8-pandoc-${pandoc_pkgver}.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp pandoc-include-code "${pkgdir}/usr/bin/"

}
