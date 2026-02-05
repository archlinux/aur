# Maintainer: stsg

pkgname=express
pkgver=3.57.24
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
sha256sums=('02c6298fff41971f74a2d932264e5d37d164294f0eba9559acc0dd43458f3850')

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
