# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Claudio d'Angelis <claudiodangelis at gmail dot com>

pkgname=postman-bin
pkgver=11.60.1
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
sha256sums_x86_64=('88749fc22dd19f1c1623b2b84514e2b596f9143e4060f8ebc256317f10102dc6'
                   'd87542ac18455ff341da7c5efd01db96a01f659b1bf546840aa4ac8bd085802d')
sha256sums_aarch64=('888c07d0b9482d370fe6166c7a7ee134f8a31360bfd58e22ae3db5ebe138a9a2'
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
