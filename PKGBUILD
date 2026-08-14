# Maintainer: Your Name <your.email@example.com>
pkgname=livechess-bin
_pkgname=livechess
pkgver=2.2
pkgrel=1
pkgdesc="DGT LiveChess software for DGT e-Boards"
arch=('x86_64')
url="https://www.livechesscloud.com/software/"
license=('custom')
depends=('alsa-lib' 'cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2'
         'gtk3' 'nspr' 'nss' 'pango' 'libdrm' 'libx11' 'libxcb' 'libxcomposite'
         'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr'
         'libxrender' 'libxss' 'libxtst' 'util-linux-libs')
provides=('livechess')
conflicts=('livechess')
options=('!strip')
source=("https://download.livechesscloud.com/installer/${pkgver}/DGT-LiveChess-${pkgver}-x86_64.deb")
sha256sums=('SKIP')

package() {
  # extract .deb contents
  bsdtar -xf "${srcdir}/DGT-LiveChess-${pkgver}-x86_64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # install license if available
  if [ -d "${pkgdir}/usr/share/doc/DGT-LiveChess" ]; then
    install -Dm644 "${pkgdir}/usr/share/doc/DGT-LiveChess/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
  fi
}
