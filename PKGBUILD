# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=postman-bin
pkgver=11.70.2
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
sha256sums_x86_64=('4f43ba6371252bb789ede904c7c0631a260e33c4b84b7b74b2491905887d010e')
sha256sums_aarch64=('3e283465515bf8257171b3c8c27595c72a716a50262d570d4de80168304b8c01')

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
