# Maintainer: phpusr
pkgname=yandex-music-player
pkgver=1.0
pkgrel=1
pkgdesc='Yandex Music desktop Electron application with MPRIS support'
arch=('x86_64')
url='https://github.com/phpusr/yandex-music-player'
license=('GPL')
depends=('electron')
makedepends=('npm')
provides=('yandex-music-player')
source_x86_64=(
  "yandex-music-player.zip::${url}/archive/v${pkgver}.tar.gz"
)
source=(
  "ymp.desktop"
  "ymp.sh"
)
sha1sums=('8ea55a3b9562281ed17d70adf2204be0b2fc84cf'
          'a10d6976131fa866a68366c5ce2e74542f54c86e')
sha1sums_x86_64=('c7aa95f96f4e4c3a8a0797201d5eee8d9c03d813')

package() {
  cd "${srcdir}/yandex-music-player-${pkgver}"

  export NODE_ENV=production
  npm install

  # Install app resources
  find . -type f -exec install -Dm644 {} "${pkgver}/usr/share/ymp/{}" \;

  # Install bin
  install -Dm755 "${srcdir}/ymp.sh" "${pkgver}/usr/bin/ymp"

  # Install desktop
  install -Dm755 "${srcdir}/ymp.desktop" "${pkgver}/usr/share/applications/ymp.desktop"
}
