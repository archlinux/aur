# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Archeb <archebasic@hotmail.com>

pkgname=opentrace-bin
pkgver=1.4.3.0
pkgrel=3
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
depends=('nexttrace' 'webkit2gtk')
makedepends=('curl')
provides=('opentrace')
conflicts=('opentrace')
source=("$pkgname-$pkgver::https://github.com/Archeb/opentrace/releases/download/v$pkgver/linux-x64.tar.gz"
        "opentrace.desktop::https://raw.githubusercontent.com/Archeb/opentrace/master/opentrace.desktop"
        "logo.png::https://raw.githubusercontent.com/nxtrace/Ntrace-core/main/asset/logo.png")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  # Fetch latest version from GitHub API
  curl -s "https://api.github.com/repos/Archeb/opentrace/releases/latest" | grep -Po '"tag_name": "v\K[^"]*'
}

package() {
  # Create target directory
  install -dm755 "${pkgdir}/opt/${pkgname}"
  
  # Copy files
  cp -r "${srcdir}"/* "${pkgdir}/opt/${pkgname}"
  
  # Create binary symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/OpenTrace" "${pkgdir}/usr/bin/opentrace"
  
  # Install desktop file and icon
  install -Dm644 "opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
  install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/opentrace.png"
}
