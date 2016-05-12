# Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="The missing desktop client for Gmail & Google Inbox"
arch=('x86_64')
url="https://github.com/Thomas101/wmail"
repo="git://github.com/Thomas101/wmail.git"
license=('MIT')
options=(!strip)
makedepends=('xdg-utils' 'desktop-file-utils')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'alsa-lib')
optdepends=('gvfs')
conflicts=('wmail')

source=(
  "wmail-linux-v${pkgver}.zip::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_linux64.zip"
  "app-v${pkgver}.png::https://raw.githubusercontent.com/Thomas101/wmail/v${pkgver}/icons/app.png"
  "wmail.desktop")
noextract=("wmail-linux-v${pkgver}.zip")
sha256sums=('b89a9307b35da5543e23a152d69b904c1af5c501c8faaacbfe68ea2a0c8bb7f3'
            '0f5e584df5f365db4cf6f422d412937cdc5cd3a92a0e92aaaaaaa42799b87552'
            '32f8dbaa210edc8e45ba2949ce309864fb6b0826a5a002cb96bd421d55e066cd')

package() {
  mkdir -p "${pkgdir}/usr/share"
  bsdtar -C "${pkgdir}/usr/share" -xf "${srcdir}/wmail-linux-v${pkgver}.zip"
  mv "${pkgdir}/usr/share/WMail-linux-x64" "${pkgdir}/usr/share/wmail"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/wmail/WMail" "${pkgdir}/usr/bin/wmail"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "${srcdir}/wmail.desktop"
  install -Dm644 "${srcdir}/app-v${pkgver}.png" "${pkgdir}/usr/share/pixmaps/WMail.png"
}
