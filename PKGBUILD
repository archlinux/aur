# Maintainer: stsg

pkgname=express
pkgver=3.56.19
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
sha256sums=('fc1606f7ab956f43d4b9cff79710bde1e75e058bdcfcab08f00153cde339ff59')

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
