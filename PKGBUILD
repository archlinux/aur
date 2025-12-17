# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=websitino-bin
pkgver=0.2.8
pkgrel=2
pkgdesc="A lightweight static file server for local development"
arch=('x86_64')
url="https://github.com/trikko/websitino"
license=('MIT')
provides=('websitino')
conflicts=('websitino')
options=('!strip')

latestver() {
  curl -s "https://api.github.com/repos/trikko/websitino/releases/latest" | grep -Po '"tag_name": "v\K[^"]*'
}

source=("websitino-${pkgver}::https://trikko.github.io/websitino/linux/websitino")
sha256sums=('SKIP')

prepare() {
  chmod +x "${srcdir}/websitino-${pkgver}"
}

package() {
  # Create directories
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  
  # Install binary
  install -Dm755 "${srcdir}/websitino-${pkgver}" "${pkgdir}/usr/bin/websitino"
  
  # Install license
  curl -s "https://raw.githubusercontent.com/trikko/websitino/main/LICENSE" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
