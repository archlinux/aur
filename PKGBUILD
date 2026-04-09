# Maintainer: LwhJesse LwhJesse@gmail.com

pkgname=reinplayer-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A modern, intuitive media player inspired by PotPlayer"
arch=('x86_64')
url="https://github.com/Ahurein/rein_player"
license=('MIT')
depends=('mpv' 'gtk3')
provides=('reinplayer')
conflicts=('reinplayer')
options=('!strip')

source=("${url}/releases/download/v${pkgver}/reinplayer_linux_amd64_portable.tar.gz"
  "reinplayer.desktop")
sha256sums=('22ea42e7104a5a1ccb973cfb90f535644c606954a0d7da85d98db870e3b33380'
            '987436b55ab2c9622f5dff6084a48e5ef39ed0fbf160596d492cec066f01e042')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"

  # Copy essential application files cleanly
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/lib" "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/rein_player" "${pkgdir}/opt/${pkgname}/rein_player"

  # Create executable symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/rein_player" "${pkgdir}/usr/bin/reinplayer"

  # Install desktop entry and application icon
  install -Dm644 "${srcdir}/reinplayer.desktop" "${pkgdir}/usr/share/applications/reinplayer.desktop"
  install -Dm644 "${srcdir}/data/flutter_assets/assets/icons/potplayer-icon.png" "${pkgdir}/usr/share/pixmaps/reinplayer.png"
}
