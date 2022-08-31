# Maintainer: duzda <duzda@disroot.com>

pkgname=deezer-enhanced-bin
_pkgname=deezer-enhanced
pkgver=0.3.1
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features, that is not just an electron wrapper.'
arch=('x86_64')
url="https://github.com/duzda/deezer-enhanced"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
provides=('deezer-enhanced')
conflicts=('deezer-enhanced')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman"
"https://raw.githubusercontent.com/duzda/deezer-enhanced/v$pkgver/LICENSE")
sha256sums=(93ec29ac7ac25f0732d0bf99b8bd4ecd4cbf1a12b92ca056b6453a5354f0d493
15f6dd3e1ca1d8d1ff5f2dddef7e0313307130e72f42f2048845a75cb8992395)

package() {
  # Main program
  install -d "${pkgdir}/opt"
  cp -r opt "${pkgdir}"

  # Desktop icon + icons
  install -dm755 "${pkgdir}/usr/"
  cp -r usr "${pkgdir}"

  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Post install
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Deezer Enhanced/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # SUID chrome-sandbox for Electron 5+
  chmod 4755 "${pkgdir}/opt/Deezer Enhanced/chrome-sandbox" || true
}