# Maintainer: phpusr
pkgname=yandex-music-player
pkgver=1.3
pkgrel=1
pkgdesc='Yandex Music desktop Electron application with MPRIS support'
arch=('x86_64')
url='https://github.com/phpusr/yandex-music-player'
license=('GPL')
depends=('electron5-bin')
makedepends=('npm')
provides=('yandex-music-player')
source_x86_64=(
  "yandex-music-player-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
source=(
  "ymp.desktop"
  "ymp.sh"
)
sha1sums=('6b8693c7069e85149c60f1057a34179a878b57b7'
          '1c13ac59bfb4e15e91f42924905f92f1ace31f0f')
sha1sums_x86_64=('a642091272c9402c4e006bb964dadc3434a59d2f')

package() {
  cd "${srcdir}/yandex-music-player-${pkgver}"

  export NODE_ENV=production
  npm install

  # Install app resources
  find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/ymp/{}" \;

  # Install bin
  install -Dm755 "${srcdir}/ymp.sh" "${pkgdir}/usr/bin/ymp"

  # Install desktop
  install -Dm755 "${srcdir}/ymp.desktop" "${pkgdir}/usr/share/applications/ymp.desktop"

  # Install icon
  install -Dm644 "assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ymp.png"
}
