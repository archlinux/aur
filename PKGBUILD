# Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=caprine-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Unofficial Facebook Messenger app"
arch=('x86_64')
url="https://github.com/sindresorhus/caprine"
repo="git://github.com/sindresorhus/caprine.git"
license=('MIT')
options=(!strip)
makedepends=('xdg-utils' 'desktop-file-utils')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'alsa-lib')
optdepends=('gvfs')
conflicts=('caprine')

source=(
  "Caprine-linux-v${pkgver}.zip::https://github.com/sindresorhus/caprine/releases/download/v${pkgver}/Caprine-linux-${pkgver}.zip"
  "caprine.desktop")
noextract=("Caprine-linux-v${pkgver}.zip")
sha256sums=('5a1cf1d7abd3a760c5fb84695413a414b5634da7302e47a0045398e05d3c21ac'
            '12b68650885651f78c6c7c2eb81fe0042474a0e7b1a857213732a449106aeaf8')

package() {
  mkdir -p "${pkgdir}/usr/share/caprine"
  bsdtar -C "${pkgdir}/usr/share/caprine" -xf "${srcdir}/Caprine-linux-v${pkgver}.zip"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/caprine/Caprine" "${pkgdir}/usr/bin/caprine"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "${srcdir}/caprine.desktop"
  install -Dm644 "${pkgdir}/usr/share/caprine/resources/app/media/Icon.png" "${pkgdir}/usr/share/pixmaps/Caprine.png"
}
