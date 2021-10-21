# Maintainer: duzda <duzda666@gmail.com>

pkgname=deezer-enhanced-git
_pkgname=deezer-enhanced
pkgver=0.1.0
pkgrel=1
pkgdesc='See deezer-enhanced-bin for binaries.
An unofficial application for Deezer with enhanced features, that is not just an electron wrapper.'
arch=('x86_64' 'arm')
url="https://github.com/duzda/deezer-enhanced"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('git' 'npm' 'nodejs' 'yarn')
provides=('deezer-enhanced')
conflicts=('deezer-enhanced')
source=(git+https://github.com/duzda/deezer-enhanced)
sha256sums=(SKIP)

build() {
  cd "$srcdir/$_pkgname"
  yarn && yarn build:pacman
}

package() {
  cd $_pkgname/dist
  tar --extract -f $_pkgname-$pkgver.pacman

  # Main program
  install -d "${pkgdir}/opt"
  cp -r opt "${pkgdir}"

  # Desktop icon + icons
  install -dm755 "${pkgdir}/usr/"
  cp -r usr "${pkgdir}"

  cd ..
  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}