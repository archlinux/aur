# Maintainer: phpusr
pkgname=yandex-music-player
pkgver=1.4
pkgrel=2
pkgdesc='Yandex Music desktop Electron application with MPRIS support'
arch=('x86_64')
url='https://github.com/phpusr/yandex-music-player'
license=('GPL')
depends=('electron16')
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
          '85990d404c762e5d6fab0643dfbba3a1a475011b')
sha1sums_x86_64=('2cf443a3cd77fe50d52163dcf20324cfbc0376c6')

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
  install -Dm644 "assets/icons/main_icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ymp.png"
}
