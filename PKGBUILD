# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.2.2
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=(x86_64)
url="https://www.naps2.com"
license=(GPL2)
depends=(sane)
optdepends=(
  "sane-airscan: airscan support"
)
provides=(${pkgname%-bin})
options=(!strip)
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.deb")
b2sums_x86_64=("046578839e69e63054c8230378a6fc264c581ac71cde5d338afbbc0d762fdc9cc5d41c4be284bd3487667b5a626595991334623c685bdc8db4bb308fd145bb0b")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix owner
  find . -exec chown -v root:root {} \;
  # Fix directory and executable permissions
  find . -type d -exec chmod -v 0755 {} \;
  find . -type f -iname *tesseract -exec chmod -v 0755 {} \;
}
