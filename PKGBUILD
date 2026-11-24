# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=dockerman-ce-bin
pkgver=6.4.1
pkgrel=1
pkgdesc="Lightweight Docker management UI built with Tauri and React"
arch=('x86_64')
url="https://dockerman.app"
license=('LicenseRef-Proprietary')
depends=(
  'dbus'
  'gtk3'
  'libayatana-appindicator'
  'openssl'
  'polkit'
  'webkit2gtk-4.1'
  'xz'
)
optdepends=(
  'docker: manage the local Docker engine'
  'trivy: image vulnerability scanning'
)
provides=('dockerman')
conflicts=('dockerman')
options=('!strip')
source=("Dockerman_${pkgver}_amd64.deb::https://github.com/ZingerLittleBee/dockerman.app/releases/download/app-v${pkgver}/Dockerman_${pkgver}_amd64.deb")
sha256sums=('9c066355f5a881b1d458cb47deecc63b29f837c6af63c472a4ac9f3bb81b169f')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # The upstream desktop entry has an empty Categories= and registers the
  # dockerman:// scheme handler without a URL argument.
  sed -i -e 's|^Categories=$|Categories=Development;System;|' \
         -e 's|^Exec=dockerman-gui$|Exec=dockerman-gui %u|' \
    "$pkgdir/usr/share/applications/Dockerman.desktop"
}
