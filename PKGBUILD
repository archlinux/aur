# Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=anatine-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Pristine Twitter app"
arch=('x86_64')
url="https://github.com/sindresorhus/anatine"
repo="git://github.com/sindresorhus/anatine.git"
license=('MIT')
options=(!strip)
makedepends=('xdg-utils' 'desktop-file-utils')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'alsa-lib')
optdepends=('gvfs')
conflicts=('anatine')

source=(
  "Anatine-linux-v${pkgver}.zip::https://github.com/sindresorhus/anatine/releases/download/${pkgver}/Anatine-linux-${pkgver}.zip"
  "Icon-${pkgver}.png::https://raw.githubusercontent.com/sindresorhus/anatine/${pkgver}/static/Icon.png"
  "anatine.desktop")
noextract=("Anatine-linux-v${pkgver}.zip")
sha256sums=('5393fff2aeb9134c2a7eeaabdf0d6891b9eb4825399177468b2a99ddd99d93e3'
            '477e4c34a15c59926568ab3b2adb7521442ebaeacb7efe729ffb81973e31a834'
            '15db1c3feb6045a62df7de8a75107ec6ae7568bbbd486245af5165e84ba3bf1b')

package() {
  mkdir -p "${pkgdir}/usr/share/anatine"
  bsdtar -C "${pkgdir}/usr/share/anatine" -xf "${srcdir}/Anatine-linux-v${pkgver}.zip"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/anatine/Anatine" "${pkgdir}/usr/bin/anatine"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "${srcdir}/anatine.desktop"
  install -Dm644 "${srcdir}/Icon-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/Anatine.png"
}
