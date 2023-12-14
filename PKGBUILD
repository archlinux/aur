# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.2.0
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
b2sums_x86_64=("0aff713e8ed6d92ebb82ed5a6072e27aa4650d259c50db7cb5fc9fc5a3ceb379db936b2d446113503a3362265a4a616c5e5f6b12532b71ecafd3e1668b5151da")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix owner
  find . -exec chown -v root:root {} \;
  # Fix directory and executable permissions
  find . -type d -exec chmod -v 0755 {} \;
  find . -type f -iname *tesseract -exec chmod -v 0755 {} \;
}
