# Maintainer: stsg

pkgname=express
pkgver=3.59.20
pkgrel=1
pkgdesc="Official Express App for Linux"
arch=('x86_64')
url="https://express.ms/download/deb"
license=('unknown')
depends=(
  gtk3
  libnotify
  nss
  libxss
  libxtst
  xdg-utils
  at-spi2-core
  util-linux-libs
  libsecret
)
optdepends=(
  libappindicator-gtk3
)
options=('!strip')
source=("https://updates.express.ms/desktop/eXpress_${pkgver}_amd64.deb")
sha256sums=('40c3efd27a4afa66c884f5a4ec8d77e9de367cc450bdc9922f5c2b6c41acb71c')

package() {
  tar -xf data.tar.xz --directory "${pkgdir}"

  # Remove Cyrillic from the path
  # mv "${pkgdir}/opt/Яндекс Музыка" "${pkgdir}/opt/yandex-music"
  # sed -i 's|/opt/Яндекс Музыка|/opt/yandex-music|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

  # Fix menu category
  # sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

  # Fix GTK version error for Gnome users
  sed -i 's|Exec="/opt/eXpress/express"|Exec="/opt/eXpress/express" --gtk-version=3|' "${pkgdir}/usr/share/applications/express.desktop"
}
