pkgname=pandoc-bin
pkgver=2.14.1
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

sha512sums=('3f9c7272cce19da2118f117768eca1f2fd31b20b15a3aba6b7d901d4634c6374f1b7c11ab085b90dde2603b2e7df91be1724757e92d1ea9912de6603595acacc')
sha512sums_x86_64=('72c41f41f582019cf53a792869e9c62abc8791420bbf7ed56e1b4e1538185d557b8b47e027ac7debffaf75a7ce485e15d6b07cf4340b7002761ac46c279831c4')
sha512sums_aarch64=('d24a0d46425ff3923317e77e34c393cf60b02016955277b05246b2d04ba310435f662362dffea18ea43a472363c1b1c757a59cef73c9ae4238d3863b8d1420fb')

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
