# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=postman-bin
pkgver=11.75.4
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
sha256sums_x86_64=('813265df090301fe6d1d2fac950f6c87bb807b60675d7cf46db976b45368acde')
sha256sums_aarch64=('a68481ab74fac24ab21f9fe64f848a7eaa77693e8880558de0f0bca7d6a0b9f5')

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
