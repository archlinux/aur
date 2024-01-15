# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.3.0
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
b2sums_x86_64=("446a67a9684ceb10db752410c2f60d8dd5ea6723499399fe78b3231afeb62d5cbc570cca1683e0782aa8e20ca7ff5f9fc98f7ebc6b270ff5e236c122a43fc2dd")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix owner
  find . -exec chown -v root:root {} \;
  # Fix directory and executable permissions
  find . -type d -exec chmod -v 0755 {} \;
  find . -type f -iname *tesseract -exec chmod -v 0755 {} \;
}
