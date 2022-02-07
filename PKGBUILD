pkgname=pandoc-bin
pkgver=2.17.1.1
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="https://pandoc.org"
license=("GPLv2+")
arch=('x86_64' 'aarch64')
conflicts=("pandoc")
provides=("pandoc")
replaces=('pandoc-static' 'pandoc-lite')
optdepends=('texlive-core: for pdf output')

# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-source-$pkgver.tar.gz::https://github.com/jgm/pandoc/archive/${pkgver}.tar.gz")
source_x86_64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-arm64.tar.gz")

sha512sums=('55414229680793cba348181c0da30046b873993f05f0b66dba7d153a8212c54ab265df1b55253f89d8fe000dacb95941e98ca516c71891bba584972d262e7d9b')
sha512sums_x86_64=('98c6eb8be9da2d0be5bc0cfc52a58d8602fb2648e1df4f1839056faa3781bd2d1d6cf9cd7b8a17d394f0d9b0d3debda63ab4bbac674f81ef88b4a5e0e6dd71c7')
sha512sums_aarch64=('d08a7ca8a463c029ae2b8767a43e91f4fa8f9a552a0b1319107a9d61999ad1dcc439ea559bf88fa2f429fe4512bf1c2112880f27f808a978b97b0580bfc1636c')

package() {
  cd "${srcdir}/pandoc-${pkgver}"

  # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
  # just yoink the binary from static compiled binary distributed by pandoc:
  mkdir -p "${pkgdir}/usr/share/pandoc"
  cp -R bin share "${pkgdir}/usr"

  # We're still missing all the datafiles and so on. We get those from the source tarball...
  cp -R data "${pkgdir}/usr/share/pandoc/"
  cp COPYRIGHT MANUAL.txt "${pkgdir}/usr/share/pandoc/"
}
