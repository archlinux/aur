# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.1.2
pkgrel=2
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
b2sums_x86_64=("1a72a838ae61f354d20ef193a82aecf726c4eec0ac93d8251a5b97389747b71055680046db0a489489447946d0533a9b73112b138ecae0ed59d19bc2a762c103")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix owner
  find . -exec chown -v root:root {} \;
  # Fix directory and executable permissions
  find . -type d -exec chmod -v 0755 {} \;
  find . -type f -iname *tesseract -exec chmod -v 0755 {} \;
}
