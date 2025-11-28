# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=postman-bin
pkgver=11.73.5
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
provides=('postman')
conflicts=('postman')
arch=('x86_64' 'aarch64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
depends=('libcups' 'systemd-libs' 'libxfixes' 'libx11' 'cairo' 'nspr' 'hicolor-icon-theme' 'bash' 'at-spi2-core' 'expat' 'libxkbcommon' 'glib2' 'pango' 'libxcomposite' 'mesa' 'nss' 'gcc-libs' 'gtk3' 'libxrandr' 'libdrm' 'libxcb' 'libxext' 'alsa-lib' 'libxdamage' 'dbus' 'libsecret' 'glibc')

source=("postman.desktop")
source_x86_64=("postman-${pkgver}-linux-x64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64")
source_aarch64=("postman-${pkgver}-linux-arm64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux_arm64")

sha256sums=('d87542ac18455ff341da7c5efd01db96a01f659b1bf546840aa4ac8bd085802d')
sha256sums_x86_64=('e02732152d2b3cf5086cd6b30b7062b2c86ac35e6a536e3d5afd43b4b70ef88b')
sha256sums_aarch64=('d860c1292560d666826f589f98fef0779663dd69ccf697ad12efec6c0fb16a54')

package() {
  install -dm755 "${pkgdir}/opt/"
  cp -r "Postman" "${pkgdir}/opt/postman"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"

  # Desktop file
  install -D -m644 "postman.desktop" "${pkgdir}/usr/share/applications/postman.desktop"

  # Icon
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -s "/opt/postman/app/resources/app/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}
