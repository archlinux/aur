pkgname=pandoc-bin
pkgver=2.14.0.3
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

sha512sums=('cd00e83779da0022d911f48ae8434ee943a11d3bc98d23f6b4fc322a2bf6487ac4792842eb63fe381f14ac6efef699dd58260e6735962852ec3cb2ec3ff27e9e')
sha512sums_x86_64=('77d906d31b1c2208783a871be49a4817188c94a6de23a3d22922462831b50d04f6793a7016616c4f030af54eed8dc1a4fd4dd53f07ea68bb8aa0f259ff7359b3')
sha512sums_aarch64=('335a6a22bb3e95aaf0e12dbf473e8cf957f3a3a92ed249df74b9e9443294de5c23e13b5ffa77ff190d79b268a47f9b9bd21170d8a2c2a8f2b4a3d0c69a9782b6')

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
