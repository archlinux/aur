# Maintainer: duzda <duzda@disroot.com>

pkgname=deezer-enhanced-bin
_pkgname=deezer-enhanced
pkgver=1.3.0
pkgrel=2
pkgdesc='An unofficial application for Deezer with enhanced features'
arch=('x86_64')
url="https://github.com/duzda/deezer-enhanced"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
provides=('deezer-enhanced')
conflicts=('deezer-enhanced')
options=('!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman"
"https://raw.githubusercontent.com/duzda/deezer-enhanced/v$pkgver/LICENSE")
sha256sums=('fa7f5d8bf7f74bbe1593dff273b161dd0b7b47b2283db58fc0f1deae0ad703a6' 
            'f2f5c024ea86b461c5f5b13fc2155c027ea34c3e0e1350327ec805328fb13966')

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
  ln -s "/opt/deezer-enhanced/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # SUID chrome-sandbox for Electron 5+
  chmod 4755 "${pkgdir}/opt/deezer-enhanced/chrome-sandbox" || true
}