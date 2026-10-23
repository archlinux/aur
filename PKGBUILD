# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=dockerman-ce-bin
pkgver=6.3.0
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
sha256sums=('7a0affed77bc33d353a54ec2378e21db2779d9da7bd85f70da56cfa9b787c4bc')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # The upstream desktop entry has an empty Categories= and registers the
  # dockerman:// scheme handler without a URL argument.
  sed -i -e 's|^Categories=$|Categories=Development;System;|' \
         -e 's|^Exec=dockerman-gui$|Exec=dockerman-gui %u|' \
    "$pkgdir/usr/share/applications/Dockerman.desktop"
}
