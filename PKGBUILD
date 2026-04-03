# Maintainer: duzda <duzda@disroot.com>

pkgname=deezer-enhanced-bin
_pkgname=deezer-enhanced
pkgver=1.5.0
pkgrel=1
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
sha256sums=('84d25332ab16167d7c44226b85ae14d4cb5e22d1cbfe527b354b9c052a4ab633'
            '03fe903a47bd58602ff80b36f86b043936a8f7c12c2980edb7826dcdd951a95b')

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