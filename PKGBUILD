# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=webtorrent-desktop-bin
_pkgname=webtorrent-desktop
pkgver=0.17.0
pkgrel=2
pkgdesc="Streaming torrent client."
arch=('i686' 'x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
depends=('gconf')
provides=('webtorrent-desktop')
conflicts=('webtorrent-desktop' 'webtorrent-desktop-git')
source=("${_pkgname}.desktop")
source_i686=("https://github.com/feross/${_pkgname}/releases/download/v${pkgver}/WebTorrent-v${pkgver}-linux-ia32.zip")
source_x86_64=("https://github.com/feross/${_pkgname}/releases/download/v${pkgver}/WebTorrent-v${pkgver}-linux.zip")
sha256sums=('4eba7b17fd0cd90f77fc1a1005f74d8fcd93dac4f669d1b1abbf71734b5bafa6')
sha256sums_i686=('a5593fd0d73d45a88450cb1ddb9b9ed933c3e2471c6672ac9075e65392f7ca38')
sha256sums_x86_64=('4f53023518cb3372f52016f0fa16d02149159b071ee2cf26c00893acc144d838')

[ "$CARCH" = "i686" ]   && _platform=ia32
[ "$CARCH" = "x86_64" ] && _platform=x64

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-${_platform}" "${pkgdir}/usr/share/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/WebTorrent" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "WebTorrent-linux-${_platform}/resources/app.asar.unpacked/static/WebTorrent.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm644 "WebTorrent-linux-${_platform}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
