pkgname=pandoc-bin
pkgver=2.14.0.2
pkgrel=2
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="http://pandoc.org"
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

sha512sums=('c0b471491a9a60d29414a52285dec88216a343a576e67e59bec16ff96a4d8683a5a1e32e53d5f53c37661d0f10345eca1dd70415f3ae0f75acc475ce17d968a4')
sha512sums_x86_64=('77ea6e0a24dcdfd0e3a3aa189b75e783c3f2ef1afdeb6d87127e668a71c2920ab27bc849883600b247f9bf3e26811b0bd25887252edb7d26b79317adb27e58ea')
sha512sums_aarch64=('f14e1d8a94a4605df045a52700fd20f374d307ab866205fbf5763b243d14b7819cc97c8a650f3d3f8e228cd7a87d199767faf46bf92a0f8e700984a791b1b8d8')

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
