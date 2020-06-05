# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fmedia-bin
pkgver=1.17
pkgrel=1
pkgdesc='Fast media player/recorder/converter'
arch=('i686' 'x86_64')
url='https://stsaz.github.io/fmedia'
license=('GPL3')
options=('!strip')
provides=('fmedia')
depends=('gtk3'
         'jack'
         'libpulse')
makedepends=('gendesk' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/stsaz/fmedia/releases/download/v${pkgver}/fmedia-${pkgver}-linux-amd64.tar.xz")
sha256sums=('d2267fe868f38c4387eadab626a9b740cdf831601126db5f067f46c5b3a9946a')

package() {
  install -Dm755 ${srcdir}/fmedia-1/fmedia -t "${pkgdir}/opt/fmedia"
  mv -v ${srcdir}/fmedia-1/fmedia.gui "${pkgdir}/opt/fmedia"
  mv -v ${srcdir}/fmedia-1/mod "${pkgdir}/opt/fmedia"
  install -Dm644 ${srcdir}/fmedia-1/fmedia.conf -t "${pkgdir}/opt/fmedia"
  install -Dm644 ${srcdir}/fmedia-1/README.txt -t "${pkgdir}/usr/share/doc/fmedia"
  install -Dm644 ${srcdir}/fmedia-1/CHANGES.txt -t "${pkgdir}/usr/share/doc/fmedia"
  install -Dm644 ${srcdir}/fmedia-1/help*.txt -t "${pkgdir}/opt/fmedia"
  install -Dm644 ${srcdir}/fmedia-1/*.ico -t "${pkgdir}/opt/fmedia"
  convert -verbose "${pkgdir}/opt/fmedia/fmedia.ico" fmedia.png
  install -Dm644 fmedia-0.png "${pkgdir}/usr/share/pixmaps/fmedia.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "fmedia" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin} --gui" \
          --categories 'Utility;Audio;AudioVideo' \
          --icon "${pkgname%-bin}"
  install -Dm644 fmedia.desktop -t "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/fmedia/fmedia "${pkgdir}/usr/bin/"
}
# vim:set ts=2 sw=2 et: