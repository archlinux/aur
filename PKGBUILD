# Maintainer: Suleyman Laarabi <suleyman.laarabi.dev@gmail.com>
pkgname=gbstudio-bin
pkgver=0.1.4
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
options=('!emptydirs')
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/GB-Studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('b2d4574c389cb1170ce7c9597fc432665fde37b3445005bdb9eff57606697b76')

package() {
  cd "${srcdir}"

  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.gz -C "${pkgdir}/" 2>/dev/null || \
  bsdtar -xf data.tar.xz -C "${pkgdir}/" 2>/dev/null || \
  bsdtar -xf data.tar.zst -C "${pkgdir}/"

  chmod -R u=rwX,go=rX "${pkgdir}/"
  chmod +x "${pkgdir}/usr/bin/gb-studio"
}
