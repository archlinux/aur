pkgname=pandoc-citeproc-bin
pkgver=1.19.2.1
pkgrel=1
pkgdesc="Pandoc Cite Processor - executable only, without 750MB Haskell depends/makedepends"
url="https://hackage.haskell.org/package/pandoc-citeproc"
license=("custom:BSD3")
arch=('x86_64')
conflicts=("pandoc-citeproc")
provides=("pandoc-citeproc")
replaces=('pandoc-citeproc-static' 'pandoc-citeproc-lite')
depends=('pandoc')

source=(
    "https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-1-amd64.deb"
)
sha256sums=(
    "db828cbab2a6d0d33f3754c4061a844ae2d1f0a01cbb12c512ef109117595dd2"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf data.tar.gz
    cp -R usr "${pkgdir}/"

    # the original pandoc executable is provided by a different package.
    rm "${pkgdir}/usr/bin/pandoc"
    rm "${pkgdir}/usr/share/man/man1/pandoc.1.gz"
    rm -R "${pkgdir}/usr/share/doc/pandoc"

}
