# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fmedia-bin
pkgver=1.30
pkgrel=1
pkgdesc='Fast media player/recorder/converter'
arch=('i686' 'x86_64')
url='https://stsaz.github.io/fmedia'
_githuburl="https://github.com/stsaz/fmedia"
license=('GPL3')
options=('!strip')
provides=()
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'jack' 'libpulse' 'dbus' 'glib2' 'gdk-pixbuf2' 'alsa-lib' 'glibc' 'pango' 'at-spi2-core' 'cairo')
makedepends=()
source=("${pkgname}-${pkgver}.tar.xz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.xz")
sha256sums=('9cd8772c4afc67536da341413ffc44b94fbf047d733b7f2468df7fd1e3890387')

package() {
  install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -ar "${srcdir}/${pkgname%-bin}-1/"* "${pkgdir}/opt/${pkgname%-bin}"
  convert "${srcdir}/${pkgname%-bin}-1/${pkgname%-bin}.ico" "${pkgname%-bin}.png"
  install -Dm644 "${srcdir}/${pkgname%-bin}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  sed 's|Exec=fmedia|Exec=/opt/fmedia/fmedia|g;s|Icon=~/bin/fmedia-1/fmedia.ico|Icon=fmedia|g' -i "${srcdir}/${pkgname%-bin}-1/${pkgname%-bin}.desktop"
  install -Dm644 "${srcdir}/${pkgname%-bin}-1/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}