# Maintainer: Suleyman Laarabi <suleyman.laarabi.dev@gmail.com>
pkgname=gbstudio-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Gameboy game development environment"
arch=('x86_64')
url="https://github.com/suleymanlaarabi/GBStudio"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
options=('!strip' '!emptydirs')
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/GB-Studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('1d093760ffe7319e2d7f00e5ae3e4ed6323e2ac49154c9e6b73a507785888ef2')

package() {
  cd "${srcdir}"

  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.gz -C "${pkgdir}/" 2>/dev/null || \
  bsdtar -xf data.tar.xz -C "${pkgdir}/" 2>/dev/null || \
  bsdtar -xf data.tar.zst -C "${pkgdir}/"

  chmod -R u=rwX,go=rX "${pkgdir}/"
  chmod +x "${pkgdir}/usr/bin/GB-Studio"
}
