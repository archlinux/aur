# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=postman-bin
pkgver=11.59.4
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
provides=('postman')
conflicts=('postman')
arch=('x86_64' 'aarch64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
source_x86_64=(
  "postman-${pkgver}-linux-x64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64"
  "postman.desktop"
)
source_aarch64=(
  "postman-${pkgver}-linux-arm64.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux_arm64"
  "postman.desktop"
)
depends=(libxss nss gtk3 alsa-lib libsecret)
sha256sums_x86_64=('f8aca2ff63e17be82038d181b68d6ee4b0aab1c02a2ac3665e53f09aaafb8d7c'
                   'd87542ac18455ff341da7c5efd01db96a01f659b1bf546840aa4ac8bd085802d')
sha256sums_aarch64=('9b09ecd0352aa54165cf7ccb73cc4ddb327028f1714ca0c08d9f0c91df76dcdf'
                    'd87542ac18455ff341da7c5efd01db96a01f659b1bf546840aa4ac8bd085802d')

package() {
  install -dm755 "${pkgdir}/opt/"
  cp -r "Postman" "${pkgdir}/opt/postman"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
  # Desktop file
  install -D -m644 "postman.desktop" \
    "${pkgdir}/usr/share/applications/postman.desktop"
  # Icon
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  ln -s "/opt/postman/app/resources/app/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}
