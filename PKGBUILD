# Maintainer: phpusr
pkgname=yandex-music-player
pkgver=1.0.1
pkgrel=1
pkgdesc='Yandex Music desktop Electron application with MPRIS support'
arch=('x86_64')
url='https://github.com/phpusr/yandex-music-player'
license=('GPL')
depends=('electron')
makedepends=('npm')
provides=('yandex-music-player')
source_x86_64=(
  "yandex-music-player.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
source=(
  "ymp.desktop"
  "ymp.sh"
)
sha1sums=('6b8693c7069e85149c60f1057a34179a878b57b7'
          'a10d6976131fa866a68366c5ce2e74542f54c86e')
sha1sums_x86_64=('26a265743827efcb6f6285e56f46dbb0d6a6c981')

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
