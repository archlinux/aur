# Maintainer: phpusr
pkgname=yandex-music-player
pkgver=1.0
pkgrel=2
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
sha1sums=('4d6814f076f656d712ddc92c80a9bdd0c7f42d3d'
          'a10d6976131fa866a68366c5ce2e74542f54c86e')
sha1sums_x86_64=('c7aa95f96f4e4c3a8a0797201d5eee8d9c03d813')

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
}
