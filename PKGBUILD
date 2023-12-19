# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.2.1
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
b2sums_x86_64=("921ea7f6b4b6243a208c416e1090d5419c4e88f3b2e7130a2fb7eae7146c1e6131cc97724314f60faa6f6d0cb7007d7f7cf51f8956af47d83e3fe68441ce8656")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix owner
  find . -exec chown -v root:root {} \;
  # Fix directory and executable permissions
  find . -type d -exec chmod -v 0755 {} \;
  find . -type f -iname *tesseract -exec chmod -v 0755 {} \;
}
